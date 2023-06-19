using System;
using System.Diagnostics;
using System.Linq;
using System.Management.Automation;
using System.Management.Automation.Runspaces;

namespace PoshTestTCPing
{
    [Cmdlet(VerbsDiagnostic.Test, "TCPing")]
    [OutputType(typeof(TestTCPingResults))]
    public class TestTCPing : PSCmdlet
    {
        [Parameter(
            Mandatory = false,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [Alias("IPAddresses")]
        [ValidateNotNull]
        public string[] ComputerName { get; set; } = new string[] { Environment.MachineName };

        [Parameter(
            Mandatory = false,
            Position = 1,
            ValueFromPipeline = false)]
        [ValidateRange(1, 65535)]
        public int Port { get; set; } = 135;

        [Parameter(
            Mandatory = false,
            Position = 2,
            ValueFromPipeline = false)]
        [ValidateRange(1, 10000)]
        public int Timeout { get; set; } = 500;

        [Parameter(
            Mandatory = false,
            Position = 3,
            ValueFromPipeline = false)]
        public SwitchParameter Quiet { get; set; }

        // Переменные для Debug
        private Stopwatch globalStopWatch = Stopwatch.StartNew();
        private int objectCount = 0;
        private TimeSpan timeout;

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
            // Запускаем глобальный таймер
            globalStopWatch.Restart();
            // И выставляем таймаут
            timeout = TimeSpan.FromMilliseconds(Timeout);
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            WriteVerbose($"Names count: {ComputerName.Count()}. TCP port: {Port}. Timeout (ms): {timeout.TotalMilliseconds}");

            foreach (string c in ComputerName)
            {
                objectCount++;

                TestTCPingResults testTCPingResults = TestTcpPort.IsPortOpen(c, Port, timeout);

                if (Quiet.IsPresent)
                {
                    WriteObject(testTCPingResults.Ping);
                }
                else
                {
                    WriteObject(testTCPingResults);
                }
            }
        }

        // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            globalStopWatch.Stop();
            WriteDebug($"Finish checks, objects count {objectCount} and time taken: {globalStopWatch.Elapsed}");
        }
    }

    // Объявляем классы
    public class TestTCPingResults
    {
        public string ComputerName { get; set; }
        public int Port { get; set; }
        public bool Ping { get; set; }
        public long PingTime { get; set; }
        public string Description { get; set; }
    }

    // И понеслись методы
    public class TestTcpPort
    {
        private static readonly Stopwatch stopwatch = Stopwatch.StartNew();
        public static TestTCPingResults IsPortOpen(string computerName, int port, TimeSpan timeout)
        {
            try
            {
                using (var client = new System.Net.Sockets.TcpClient())
                {
                    stopwatch.Restart();

                    var result = client.ConnectAsync(computerName, port);

                    if (result.Wait(timeout))
                    {
                        if (client.Connected)
                        {
                            return new TestTCPingResults
                            {
                                ComputerName = computerName,
                                Port = port,
                                Ping = true,
                                PingTime = stopwatch.ElapsedMilliseconds,
                                Description = "Port is open"
                            };
                        }
                        else
                        {
                            return new TestTCPingResults
                            {
                                ComputerName = computerName,
                                Port = port,
                                Ping = false,
                                PingTime = stopwatch.ElapsedMilliseconds,
                                Description = "Port filtered"
                            };
                        }
                    }
                    else
                    {
                        return new TestTCPingResults
                        {
                            ComputerName = computerName,
                            Port = port,
                            Ping = false,
                            PingTime = stopwatch.ElapsedMilliseconds,
                            Description = "Timeout"
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                return new TestTCPingResults
                {
                    ComputerName = computerName,
                    Port = port,
                    Ping = false,
                    PingTime = stopwatch.ElapsedMilliseconds,
                    Description = $"Error: {ex.InnerException.Message}"
                };
            }
        }
    }
}

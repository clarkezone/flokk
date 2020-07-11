using System;
using System.Threading.Tasks;

namespace GraphTestCS
{
    class Program
    {
        // Get calendars from my outlook.com personal account

        static async Task Main(string[] args)
        {
            //TODO: open webbrowser for WLID auth, print out token
            //TODO: read token from cmdline

            string accessToken = "";

            var graphServiceClient = new Microsoft.Graph.GraphServiceClient(new Microsoft.Graph.DelegateAuthenticationProvider((request) =>
            {
                request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("bearer", accessToken);
                return Task.FromResult(0);

            }));

            var calendars = await graphServiceClient.Me.Calendars.Request().GetAsync();

            foreach (var item in calendars)
            {
                Console.WriteLine(item.Name);
            }
        }
    }
}

using System;
using System.Threading.Tasks;

namespace GraphTestCS
{
    class Program
    {
        // Get calendars from my outlook.com personal account

        static async Task Main(string[] args)
        {
            //TODO get a token from msgraphtest\cs\TokenGetterCS
            string accessToken = replacewithtoken;

            var graphServiceClient = new Microsoft.Graph.GraphServiceClient(new Microsoft.Graph.DelegateAuthenticationProvider((request) =>
            {
                request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("bearer", accessToken);
                return Task.FromResult(0);

            }));

            var me = await graphServiceClient.Me.Request().GetAsync();
            var calendars = await graphServiceClient.Me.Calendars.Request().GetAsync();

            foreach (var item in calendars)
            {
                Console.WriteLine(item.Name);
            }
        }
    }
}

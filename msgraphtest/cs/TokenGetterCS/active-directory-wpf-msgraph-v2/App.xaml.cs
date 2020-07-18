using Microsoft.Identity.Client;
using System.Windows;

namespace active_directory_wpf_msgraph_v2
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    
    // To change from Microsoft public cloud to a national cloud, use another value of AzureCloudInstance
    public partial class App : Application
    {
        static App()
        {
            _clientApp = PublicClientApplicationBuilder.Create(ClientId)
                .WithAuthority($"{Instance}{Tenant}")
                .WithDefaultRedirectUri()
                .Build();
            TokenCacheHelper.EnableSerialization(_clientApp.UserTokenCache);
        }

        //TODO: clientID in onenote
        private static string ClientId = replacewithclientIDfromonenote;

        // Note: Tenant is important for the quickstart. We'd need to check with Andre/Portal if we
        // want to change to the AadAuthorityAudience.
        private static string Tenant = "common";
        private static string Instance = "https://login.microsoftonline.com/";
        private static IPublicClientApplication _clientApp ;

        public static IPublicClientApplication PublicClientApp { get { return _clientApp; } }
    }
}

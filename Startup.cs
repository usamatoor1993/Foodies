using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Foodies.Startup))]
namespace Foodies
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

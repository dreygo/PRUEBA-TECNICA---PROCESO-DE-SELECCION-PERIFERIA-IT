using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Instituto.Startup))]
namespace Instituto
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

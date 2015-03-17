using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCForum.Website.Utilities
{
    public static class Captcha
    {
        public static bool isValidGUID(string guid)
        {
            return HttpRuntime.Cache[guid] != null;
        }

        public static bool isValidAnswer(string guid, string answer)
        {
            if (isValidGUID(guid))
            {
                Dictionary<string, string> cachecontent = HttpRuntime.Cache[guid] as Dictionary<string, string>;
                return answer == cachecontent["Answer"];
            }
            return false;
        }
    }
}
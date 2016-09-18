package
{
   import flash.events.EventDispatcher;
   import flash.display.Loader;
   import flash.system.LoaderContext;
   import flash.system.ApplicationDomain;
   import flash.system.SecurityDomain;
   import flash.net.URLRequest;
   import flash.events.Event;
   import flash.display.MovieClip;
   import flash.events.IEventDispatcher;
   
   public class LogoLoad extends EventDispatcher
   {
      
      private static var _instance:LogoLoad;
      
      public static const INIT_LOGO_COMPLETE:String = "init_logo_complete";
      
      public static var _optID:int;
       
      
      private var _url:String;
      
      private var load:Loader;
      
      public function LogoLoad(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get instance() : LogoLoad
      {
         if(_instance == null)
         {
            _instance = new LogoLoad();
         }
         return _instance;
      }
      
      public function startLoad(param1:String, param2:int, param3:String = "160") : void
      {
         _optID = param2;
         var _loc4_:* = _optID;
         if(590 !== _loc4_)
         {
            if(592 !== _loc4_)
            {
               if(610 !== _loc4_)
               {
                  if(686 !== _loc4_)
                  {
                     _url = param1 + "logo_en.swf";
                  }
                  else
                  {
                     _url = param1 + "logo_ru.swf";
                  }
               }
               else
               {
                  _url = param1 + "logo_tw.swf?v=20160407";
               }
            }
            addr68:
            loadConfig();
            return;
         }
         if(param3 == "160")
         {
            _url = param1 + "logo_en.swf";
         }
         else if(param3 == "167")
         {
            _url = param1 + "logo_fz.swf";
         }
         §§goto(addr68);
      }
      
      private function loadConfig() : void
      {
         load = new Loader();
         var _loc2_:LoaderContext = new LoaderContext();
         _loc2_.applicationDomain = new ApplicationDomain();
         _loc2_.checkPolicyFile = true;
         _loc2_.securityDomain = SecurityDomain.currentDomain;
         load.contentLoaderInfo.addEventListener("complete",loadComplete);
         var _loc1_:URLRequest = new URLRequest(_url + "?v=20160326");
         load.load(_loc1_);
      }
      
      private function loadComplete(param1:Event) : void
      {
         load.removeEventListener("complete",loadComplete);
         this.dispatchEvent(new Event("init_logo_complete"));
      }
      
      public function getLogo() : MovieClip
      {
         var _loc1_:Class = load.contentLoaderInfo.applicationDomain.getDefinition("MC_Logo") as Class;
         return new _loc1_() as MovieClip;
      }
   }
}

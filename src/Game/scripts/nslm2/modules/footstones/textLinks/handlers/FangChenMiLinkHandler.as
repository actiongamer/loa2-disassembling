package nslm2.modules.footstones.textLinks.handlers
{
   import morn.core.utils.URLUtils;
   
   public class FangChenMiLinkHandler extends LinkHandlerBase
   {
       
      
      public function FangChenMiLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:String = evtContent[0];
         _loc1_ = decodeURI(_loc1_);
         URLUtils.openWindow(_loc1_);
      }
   }
}

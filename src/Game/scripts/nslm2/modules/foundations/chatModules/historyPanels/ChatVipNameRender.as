package nslm2.modules.foundations.chatModules.historyPanels
{
   import morn.core.components.Component;
   import nslm2.common.ui.components.comps2d.externals.qqs.QQVipImage;
   import nslm2.mgrs.skins.SkinLib;
   
   public class ChatVipNameRender extends Component
   {
       
      
      public function ChatVipNameRender(param1:int, param2:Boolean, param3:Boolean)
      {
         super();
         var _loc4_:QQVipImage = new QQVipImage(SkinLib.vipIconPic(param1,param2,param3));
         this.addChild(_loc4_);
      }
   }
}

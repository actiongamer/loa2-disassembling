package nslm2.modules.foundations.chatModules.privChats
{
   import game.ui.chatModules.privChats.PrivChatPlayerRenderUI;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   
   public class PrivChatPlayerRender extends PrivChatPlayerRenderUI
   {
       
      
      public var vo:nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
      
      public function PrivChatPlayerRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         vo = param1 as nslm2.modules.foundations.chatModules.privChats.PrivChatHistoryVo;
         if(vo)
         {
            .super.dataSource = vo.friendData;
         }
      }
      
      override protected function validateTxtName() : void
      {
         if(playerVo && playerVo.name != null)
         {
            this.ref_txt_name.text = LabelMed.vipParam(this.playerVo.vipInfoVo) + LinkUtils.playerName(playerVo.playerId,playerVo.name,playerVo.disID,ColorLib.qualityColor(playerVo.militaryQuality),null,this.playerVo.gmtype);
            this.ref_txt_name.visible = true;
         }
         else
         {
            this.ref_txt_name.visible = false;
         }
      }
   }
}

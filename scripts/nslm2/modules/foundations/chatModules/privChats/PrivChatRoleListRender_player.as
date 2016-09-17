package nslm2.modules.foundations.chatModules.privChats
{
   import game.ui.chatModules.privChats.PrivChatRoleListRender_playerUI;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   
   public class PrivChatRoleListRender_player extends PrivChatRoleListRender_playerUI
   {
       
      
      public function PrivChatRoleListRender_player()
      {
         super();
      }
      
      override protected function validateTxtName() : void
      {
         if(playerVo && playerVo.name != null)
         {
            this.txt_vipInfo.text = LabelMed.vipParam(this.playerVo.vipInfoVo);
            this.ref_txt_name.text = LinkUtils.playerName(playerVo.playerId,playerVo.name,playerVo.disID,ColorLib.qualityColor(playerVo.militaryQuality),null,this.playerVo.gmtype);
            this.ref_txt_name.visible = true;
            this.txt_vipInfo.visible = true;
         }
         else
         {
            this.txt_vipInfo.visible = false;
            this.ref_txt_name.visible = false;
         }
      }
   }
}

package nslm2.modules.foundations.chatModules.privChats
{
   import game.ui.chatModules.privChats.PrivChatRoleListRenderUI;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.LabelMed;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.uiEffects.RollTweenVisibleMed;
   
   public class PrivChatRoleListRender extends PrivChatRoleListRenderUI
   {
      
      public static const REMOVE:String = "remove";
       
      
      public function PrivChatRoleListRender()
      {
         super();
         this.btn_remove.addEventListener("click",btn_remove_onClick);
         this.parts.push(new RollTweenVisibleMed(this,this.btn_remove.bg));
         this.addEventListener("focusIn",onFocusIn);
         this.addEventListener("focusOut",onFocusOut);
      }
      
      public function get redPoiChatCoun() : RedPointNum
      {
         return this.redPoiChatCountUI as RedPointNum;
      }
      
      protected function onFocusOut(param1:FocusEvent) : void
      {
      }
      
      protected function onFocusIn(param1:FocusEvent) : void
      {
      }
      
      public function get vo() : PrivChatHistoryVo
      {
         return dataSource as PrivChatHistoryVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.render_playerUI.gameFriendData = vo.friendData;
         }
      }
      
      private function btn_remove_onClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new MzEvent("remove",this.vo,true));
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

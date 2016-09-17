package nslm2.modules.cultivates.lotteryHeroModules.results
{
   import game.ui.lotteryHeroModules.results.ResultOneUI;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import com.greensock.TweenLite;
   import nslm2.modules.roleInfos.equipPanels.RoleDetailPropPanel;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   
   public class ResultOne extends ResultOneUI
   {
       
      
      private var reward:HeroInfo;
      
      private var detailPropPanel:RoleDetailPropPanel;
      
      public function ResultOne()
      {
         super();
         this.txt_more.text = TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(999000071),new TextFormat(),"");
         this.txt_more.addEventListener("click",txt_moreHandler);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         super.btnCloseHandler(param1);
         this.dispatchEvent(new Event("evtResultClose",true));
      }
      
      public function show(param1:HeroInfo, param2:Array) : void
      {
         this.reward = param1;
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         this.img_group.skin = UrlLib.npcGroupImg(_loc3_.group);
         this.img_group.toolTip = LocaleMgr.ins.getStr(30100310 + _loc3_.group);
         this.txt_name.color = ColorLib.qualityColor(_loc3_.quality);
         this.txt_name.text = LocaleMgr.ins.getStr(_loc3_.name);
         this.txt_type.text = LocaleMgr.ins.getStr(5000 + _loc3_.career_id);
         if(param2)
         {
         }
         this.list_skill.array = _loc3_.skillIdArr;
         this.right = -this.width;
         this.visible = true;
         TweenLite.to(this,0.3,{"right":0});
      }
      
      private function txt_moreHandler(param1:MouseEvent) : void
      {
         showDetialPropPanel();
      }
      
      private function showDetialPropPanel() : void
      {
         if(detailPropPanel)
         {
            this.disposeDetailPropPanel();
         }
         else
         {
            detailPropPanel = new RoleDetailPropPanel();
            detailPropPanel.isRoleModule = false;
            detailPropPanel.fadeViewId = 30100;
            detailPropPanel.x = -127;
            detailPropPanel.y = 9;
            this.addChild(detailPropPanel);
            detailPropPanel.show(reward);
            detailPropPanel.addEventListener("close",disposeDetailPropPanel);
            detailPropPanel.panelFadeIn();
         }
      }
      
      private function disposeDetailPropPanel(... rest) : void
      {
         if(detailPropPanel)
         {
            detailPropPanel.removeEventListener("close",disposeDetailPropPanel);
            detailPropPanel.panelFadeOutAndDispose();
            detailPropPanel = null;
         }
      }
   }
}

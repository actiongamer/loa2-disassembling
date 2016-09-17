package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.render.HCHeroHeadRenderUI;
   import proto.HeroInfo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   
   public class HCHeroHeadRender extends HCHeroHeadRenderUI
   {
       
      
      public var idx:int;
      
      public var hero:HeroInfo;
      
      public function HCHeroHeadRender()
      {
         super();
         btn_close.clickHandler = removeSelf;
         this.img_plus.addEventListener("click",imgPlusClickHandler);
         this.img_icon.addEventListener("click",imgPlusClickHandler);
         this.txt_herodesc.text = LocaleMgr.ins.getStr(11600000);
         this.buttonMode = true;
      }
      
      protected function imgPlusClickHandler(param1:MouseEvent) : void
      {
         if(this.dataSource == null)
         {
            ObserverMgr.ins.sendNotice("hc_select_panel",this.idx);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:HeroInfo = param1 as HeroInfo;
         this.hero = _loc2_;
         if(_loc2_)
         {
            .super.dataSource = WealthUtil.createNpcVo(_loc2_.baseInfo.baseId);
            if(idx == 0 && Uint64Util.equal(_loc2_.baseInfo.id,PlayerModel.ins.playerInfo.playerHero.baseInfo.id))
            {
               txt_name.color = ColorLib.getMilitaryColor(PlayerModel.ins.playerInfo.militaryrank);
               txt_name.text = PlayerModel.ins.playerInfo.name;
            }
            else if(idx == 1 && Uint64Util.equal(_loc2_.baseInfo.id,OtherRoleInfoModel.ins.playerHero.baseInfo.id))
            {
               txt_name.color = ColorLib.getMilitaryColor(OtherRoleInfoModel.ins.military);
               txt_name.text = OtherRoleInfoModel.ins.name;
            }
            txt_name.visible = true;
            img_plus.visible = false;
            btn_close.visible = true;
            txt_herodesc.visible = false;
         }
         else
         {
            txt_name.visible = true;
            img_plus.visible = true;
            btn_close.visible = false;
            txt_herodesc.visible = true;
            if(idx == 0 || idx == 2)
            {
               txt_herodesc.text = LocaleMgr.ins.getStr(999000074);
            }
            .super.dataSource = null;
            img_quality.visible = true;
            img_quality.skin = ori_img_quality_skin + 1;
         }
      }
      
      override protected function validateTooltip() : void
      {
         this.toolTip = null;
      }
      
      private function removeSelf(param1:Button) : void
      {
         ObserverMgr.ins.sendNotice("hc_remove_hero",this.idx);
         txt_name.visible = true;
         img_plus.visible = true;
         btn_close.visible = false;
         txt_herodesc.visible = true;
         this.hero = null;
         this.dataSource = null;
      }
   }
}

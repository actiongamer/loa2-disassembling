package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.HeroCompareModuleUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.HeroInfo;
   import com.mz.core.utils.DisplayUtils;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class HCModule extends HeroCompareModuleUI implements IObserver
   {
       
      
      private var selectPos:int;
      
      public function HCModule()
      {
         super();
         switchEventListeners(true);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         (this.listHeroHead.cells[0] as HCHeroHeadRender).idx = 0;
         (this.listHeroHead.cells[1] as HCHeroHeadRender).idx = 1;
         (this.listHeroHead.cells[2] as HCHeroHeadRender).idx = 2;
         (this.listHeroHead.cells[3] as HCHeroHeadRender).idx = 3;
         (this.listHeroHead.cells[0] as HCHeroHeadRender).txt_name.text = "";
         (this.listHeroHead.cells[1] as HCHeroHeadRender).txt_name.text = "";
         (this.listHeroHead.cells[2] as HCHeroHeadRender).txt_name.text = "";
         (this.listHeroHead.cells[3] as HCHeroHeadRender).txt_name.text = "";
         (this.listHeroHead.cells[0] as HCHeroHeadRender).txt_herodesc.text = LocaleMgr.ins.getStr(999000074);
         (this.listHeroHead.cells[2] as HCHeroHeadRender).txt_herodesc.text = LocaleMgr.ins.getStr(999000074);
         (this.listHeroHead.cells[1] as HCHeroHeadRender).txt_herodesc.text = LocaleMgr.ins.getStr(999000075);
         (this.listHeroHead.cells[3] as HCHeroHeadRender).txt_herodesc.text = LocaleMgr.ins.getStr(999000075);
         HCModel.ins.SetHero(0,HeroModel.ins.playerHero);
         HCModel.ins.SetHero(1,OtherRoleInfoModel.ins.playerHero);
         this.refreshHC(0);
         var _loc3_:RoleTeamVo = this.GetMaxAbilityHero(HeroModel.ins.teamHeroArrWithoutPlayer);
         if(_loc3_ != null)
         {
            _loc4_ = this.GetMaxAbilityHeroByKind(OtherRoleInfoModel.ins.teamHeroArrWithoutPlayer,StcMgr.ins.getNpcVo(_loc3_.heroData.baseId).career_id);
            if(_loc4_ != null)
            {
               HeroModel.ins.getHeroInfo(_loc3_.heroData.id,this.initSelfHeroHandler);
               _loc2_ = OtherRoleInfoModel.ins.getHeroInfo(_loc4_.heroData.id);
               HCModel.ins.SetHero(3,_loc2_);
               this.refreshHC(2);
            }
         }
         DisplayUtils.addChildFromGlobal(this.panelBg.bgCustom,this.img_bghead);
      }
      
      private function GetMaxAbilityHero(param1:Array) : RoleTeamVo
      {
         var _loc2_:* = null;
         if(param1 == null || param1.length == 0)
         {
            return null;
         }
         var _loc3_:UInt64 = new UInt64();
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(_loc4_.heroData != null)
            {
               if(Uint64Util.compareValue(_loc4_.heroData.ability,_loc3_) == 1)
               {
                  _loc3_ = _loc4_.heroData.ability;
                  _loc2_ = _loc4_;
               }
            }
         }
         return _loc2_;
      }
      
      private function GetMaxAbilityHeroByKind(param1:Array, param2:int) : RoleTeamVo
      {
         var _loc8_:* = null;
         if(param1 == null || param1.length == 0)
         {
            return null;
         }
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc6_:UInt64 = new UInt64();
         var _loc4_:UInt64 = new UInt64();
         var _loc10_:int = 0;
         var _loc9_:* = param1;
         for each(var _loc7_ in param1)
         {
            if(_loc7_.heroData != null)
            {
               _loc8_ = StcMgr.ins.getNpcVo(_loc7_.heroData.baseId);
               if(_loc8_.career_id == param2 && Uint64Util.compareValue(_loc7_.heroData.ability,_loc4_) == 1)
               {
                  _loc4_ = _loc7_.heroData.ability;
                  _loc3_ = _loc7_;
               }
               if(Uint64Util.compareValue(_loc7_.heroData.ability,_loc6_) == 1)
               {
                  _loc6_ = _loc7_.heroData.ability;
                  _loc5_ = _loc7_;
               }
            }
         }
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         return _loc5_;
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["hc_select_panel","hc_remove_hero","hc_select_hero"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc8_:* = param1;
         if("hc_select_panel" !== _loc8_)
         {
            if("hc_remove_hero" !== _loc8_)
            {
               if("hc_select_hero" === _loc8_)
               {
                  _loc4_ = param2 as Array;
                  _loc6_ = _loc4_[0] as UInt64;
                  _loc7_ = _loc4_[1] as int;
                  this.selectPos = _loc7_;
                  if(_loc7_ % 2 == 0)
                  {
                     HeroModel.ins.getHeroInfo(_loc6_,this.selectSelfHeroHandler);
                  }
                  else
                  {
                     _loc5_ = OtherRoleInfoModel.ins.getHeroInfo(_loc6_ as UInt64);
                  }
                  if(_loc5_ != null)
                  {
                     HCModel.ins.SetHero(_loc7_,_loc5_);
                  }
                  refreshHC(_loc7_);
               }
            }
            else
            {
               _loc3_ = param2 as int;
               HCModel.ins.SetHero(_loc3_,null);
               this.listHeroInfo.cells[_loc3_].dataSource = null;
               this.listHeroHead.cells[_loc3_].dataSource = null;
            }
         }
         else
         {
            ModuleMgr.ins.showModule(11701,param2,11700);
         }
      }
      
      private function selectSelfHeroHandler(param1:HeroInfo) : void
      {
         HCModel.ins.SetHero(this.selectPos,param1);
         refreshHC(this.selectPos);
      }
      
      private function initSelfHeroHandler(param1:HeroInfo) : void
      {
         HCModel.ins.SetHero(2,param1);
         refreshHC(2);
      }
      
      private function refreshHC(param1:int) : void
      {
         if(param1 < 2)
         {
            if(HCModel.ins.GetHero(0) != null && HCModel.ins.GetHero(1) != null)
            {
               this.listHeroInfo.cells[0].dataSource = [HCModel.ins.GetHero(0),HCModel.ins.GetHero(1)];
            }
            else
            {
               this.listHeroInfo.cells[0].dataSource = [HCModel.ins.GetHero(0)];
            }
            this.listHeroInfo.cells[1].dataSource = [HCModel.ins.GetHero(1),HCModel.ins.GetHero(0)];
            this.listHeroHead.cells[0].dataSource = HCModel.ins.GetHero(0);
            this.listHeroHead.cells[1].dataSource = HCModel.ins.GetHero(1);
         }
         else
         {
            if(HCModel.ins.GetHero(0) != null && HCModel.ins.GetHero(1) != null)
            {
               this.listHeroInfo.cells[2].dataSource = [HCModel.ins.GetHero(2),HCModel.ins.GetHero(3)];
            }
            else
            {
               this.listHeroInfo.cells[2].dataSource = [HCModel.ins.GetHero(2)];
            }
            this.listHeroInfo.cells[3].dataSource = [HCModel.ins.GetHero(3)];
            this.listHeroHead.cells[2].dataSource = HCModel.ins.GetHero(2);
            this.listHeroHead.cells[3].dataSource = HCModel.ins.GetHero(3);
         }
      }
   }
}

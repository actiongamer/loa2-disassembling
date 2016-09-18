package nslm2.modules.foundations.ranks.comp
{
   import game.ui.rankModules.RankListRenderUI;
   import proto.StageStarRankData;
   import proto.AbilityRankData;
   import proto.LevelRankData;
   import proto.FamilyRankData;
   import proto.AreaRankData;
   import nslm2.utils.LabelMed;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.skins.SkinLib;
   
   public class RankListRender extends RankListRenderUI
   {
       
      
      public function RankListRender()
      {
         super();
      }
      
      public function get stagestar() : StageStarRankData
      {
         return this.dataSource as StageStarRankData;
      }
      
      public function get ability() : AbilityRankData
      {
         return this.dataSource as AbilityRankData;
      }
      
      public function get level() : LevelRankData
      {
         return this.dataSource as LevelRankData;
      }
      
      public function get family() : FamilyRankData
      {
         return this.dataSource as FamilyRankData;
      }
      
      public function get area() : AreaRankData
      {
         return this.dataSource as AreaRankData;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.txt_2.removeEventListener("click",clickNameHandler);
         this.txt_3.removeEventListener("click",clickNameHandler);
         this.txt_4.removeEventListener("click",clickNameHandler);
         .super.dataSource = param1;
         this.img_bg.skin = "png.uiRankModule.选中框01";
         this.txt_2.buttonMode = false;
         this.txt_3.buttonMode = false;
         this.txt_4.buttonMode = false;
         this.txt_2.underline = false;
         this.txt_3.underline = false;
         this.txt_4.underline = false;
         this.txt_2.color = 14210735;
         this.txt_3.color = 14210735;
         this.txt_4.color = 14210735;
         if(this.stagestar)
         {
            setSkinfornum(this.stagestar.rank);
            this.txt_2.text = LabelMed.vipParam(VipUtils.qqInfoToVipInfoVo(this.stagestar.qqInfo)) + LinkUtils.playerNameSmart(this.stagestar.id,this.stagestar.name,0,16046112);
            this.txt_3.text = String(this.stagestar.level);
            if(this.stagestar.familyName == "")
            {
               this.txt_4.text = "————";
            }
            else
            {
               this.txt_4.text = String(this.stagestar.familyName);
               this.txt_4.mouseEnabled = true;
               this.txt_4.underline = true;
               this.txt_4.color = 16773888;
               this.txt_4.buttonMode = true;
               this.txt_4.addEventListener("click",clickNameHandler);
            }
            this.txt_5.text = String(this.stagestar.star);
         }
         else if(this.ability)
         {
            setSkinfornum(this.ability.rank);
            this.txt_2.text = LabelMed.vipParam(VipUtils.qqInfoToVipInfoVo(this.ability.qqInfo)) + LinkUtils.playerNameSmart(this.ability.id,this.ability.name,0,16046112);
            if(this.ability.familyName == "")
            {
               this.txt_3.text = "————";
            }
            else
            {
               this.txt_3.text = String(this.ability.familyName);
               this.txt_3.mouseEnabled = true;
               this.txt_3.underline = true;
               this.txt_3.color = 16773888;
               this.txt_3.buttonMode = true;
               this.txt_3.addEventListener("click",clickNameHandler);
            }
            this.txt_4.text = String(this.ability.level);
            this.txt_5.text = LocaleConsts.getNumberAbbr2(String(this.ability.ability));
         }
         else if(this.level)
         {
            setSkinfornum(this.level.rank);
            this.txt_2.text = LabelMed.vipParam(VipUtils.qqInfoToVipInfoVo(this.level.qqInfo)) + LinkUtils.playerNameSmart(this.level.id,this.level.name,0,16046112);
            if(this.level.familyName == "")
            {
               this.txt_3.text = "————";
            }
            else
            {
               this.txt_3.text = String(this.level.familyName);
               this.txt_3.mouseEnabled = true;
               this.txt_3.underline = true;
               this.txt_3.color = 16773888;
               this.txt_3.buttonMode = true;
               this.txt_3.addEventListener("click",clickNameHandler);
            }
            this.txt_4.text = LocaleConsts.getNumberAbbr2(String(this.level.ability));
            this.txt_5.text = String(this.level.level);
         }
         else if(this.family)
         {
            setSkinfornum(this.family.rank);
            this.txt_2.text = this.family.name;
            this.txt_3.text = LabelMed.vipParam(VipUtils.qqInfoToVipInfoVo(this.family.qqInfo)) + LinkUtils.playerNameSmart(this.family.leaderId,this.family.leaderName,0,16046112);
            this.txt_4.text = String(this.family.level);
            this.txt_5.text = String(this.family.number);
            this.txt_2.mouseEnabled = true;
            this.txt_2.underline = true;
            this.txt_2.color = 16773888;
            this.txt_2.buttonMode = true;
            this.txt_2.addEventListener("click",clickNameHandler);
         }
         else if(this.area)
         {
            setSkinfornum(this.area.rank);
            this.txt_2.text = LabelMed.vipParam(VipUtils.qqInfoToVipInfoVo(this.area.qqInfo)) + LinkUtils.playerNameSmart(this.area.id,this.area.name,0,16046112);
            if(this.area.family == "")
            {
               this.txt_3.text = "————";
            }
            else
            {
               this.txt_3.text = String(this.area.family);
               this.txt_3.mouseEnabled = true;
               this.txt_3.underline = true;
               this.txt_3.color = 16773888;
               this.txt_3.buttonMode = true;
               this.txt_3.addEventListener("click",clickNameHandler);
            }
            this.txt_4.text = LocaleConsts.getNumberAbbr2(String(this.area.ability));
            this.txt_5.text = String(this.area.level);
         }
      }
      
      private function clickNameHandler(param1:MouseEvent) : void
      {
         if(this.stagestar)
         {
            ModuleMgr.ins.showModule(40709,this.stagestar.familId,ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(this.ability)
         {
            ModuleMgr.ins.showModule(40709,this.ability.familId,ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(this.level)
         {
            ModuleMgr.ins.showModule(40709,this.level.familId,ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(this.family)
         {
            ModuleMgr.ins.showModule(40709,this.family.familId,ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(this.area)
         {
            ModuleMgr.ins.showModule(40709,this.area.familId,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function setSkinfornum(param1:int) : void
      {
         switch(int(param1) - 1)
         {
            case 0:
            case 1:
            case 2:
               this.img_huangguan.skin = SkinLib.getRankCrown(param1);
               this.txt_1.text = "";
         }
      }
   }
}

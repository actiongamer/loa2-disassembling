package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.render.HCHeroInfoRenderUI;
   import nslm2.modules.footstones.tooltipsModules.ToolTipYuanFenVo;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.tooltipsModules.TooltipTianfuVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.HeroModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   
   public class HCHeroInfoRender extends HCHeroInfoRenderUI
   {
       
      
      public function HCHeroInfoRender()
      {
         super();
      }
      
      private function getMengYueTip(param1:HeroInfo) : ToolTipYuanFenVo
      {
         var _loc2_:ToolTipYuanFenVo = new ToolTipYuanFenVo([]);
         _loc2_.mengYueArr = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(param1.baseInfo.baseId),param1.baseInfo.mengyue,null,-1);
         return _loc2_;
      }
      
      private function getTupoTip() : TooltipTianfuVo
      {
         return null;
      }
      
      private function Clear() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < listBaseInfo.cells.length)
         {
            listBaseInfo.cells[_loc1_].dataSource = null;
            _loc1_++;
         }
         cellTupo.dataSource = null;
         cellJieshu.dataSource = null;
         cellMilitaryRank.dataSource = null;
         cellHorse.dataSource = null;
         cellFashion.dataSource = null;
         cellYuanfen.dataSource = null;
         listEquipInfo.cells[0].dataSource = null;
         listEquipInfo.cells[1].dataSource = null;
         listBaowuInfo.cells[0].dataSource = null;
         listBaowuInfo.cells[1].dataSource = null;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc5_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:* = null;
         var _loc11_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            this.Clear();
            return;
         }
         var _loc7_:Array = param1 as Array;
         if(_loc7_.length == 1)
         {
            _loc14_ = _loc7_[0] as HeroInfo;
            if(_loc14_ == null)
            {
               this.Clear();
               return;
            }
            listBaseInfo.cells[0].dataSource = [_loc14_.baseInfo.fightValue.toString()];
            listBaseInfo.cells[1].dataSource = [_loc14_.baseInfo.level.toString() + LocaleMgr.ins.getStr(11700022)];
            listBaseInfo.cells[2].dataSource = [int(_loc14_.prop.physicalDefence).toString()];
            listBaseInfo.cells[3].dataSource = [int(_loc14_.prop.magicDefence).toString()];
            listBaseInfo.cells[4].dataSource = [int(_loc14_.prop.hp).toString()];
            listBaseInfo.cells[5].dataSource = [int(_loc14_.prop.attack).toString()];
            listBaseInfo.cells[6].dataSource = [int(_loc14_.prop.agility).toString()];
            (cellTupo as HCCellRender).xiahuaxian = true;
            cellTupo.dataSource = [StcMgr.ins.getNpcVo(_loc14_.baseInfo.baseId).tupo.toString() + LocaleMgr.ins.getStr(11700022)];
            cellJieshu.dataSource = [_loc14_.baseInfo.sjLevel.toString() + LocaleMgr.ins.getStr(11700023)];
            (cellYuanfen as HCCellRender).xiahuaxian = true;
            cellYuanfen.dataSource = [_loc14_.baseInfo.mengyue.length.toString() + LocaleMgr.ins.getStr(11700024)];
            cellYuanfen.toolTip = getMengYueTip(_loc14_);
            cellTupo.toolTip = new TooltipTianfuVo(_loc14_.baseInfo.baseId);
            listEquipInfo.cells[0].dataSource = [_loc14_.baseInfo.strengthLSlv.toString() + LocaleMgr.ins.getStr(11700022)];
            listEquipInfo.cells[1].dataSource = [_loc14_.baseInfo.jinglianLSLv.toString() + LocaleMgr.ins.getStr(11700022)];
            listBaowuInfo.cells[0].dataSource = [_loc14_.baseInfo.baowuStrLs.toString() + LocaleMgr.ins.getStr(11700022)];
            listBaowuInfo.cells[1].dataSource = [_loc14_.baseInfo.baowuFumLs.toString() + LocaleMgr.ins.getStr(11700022)];
            if(HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc14_.baseInfo.baseId))
            {
               _loc15_ = PlayerModel.ins.playerInfo.militaryrank;
               _loc5_ = HorseService.ins.activatedHorseList.length;
               _loc12_ = FashionModel.ins.clothDict.array.length;
               cellMilitaryRank.dataSource = [_loc10_.toString()];
               cellHorse.dataSource = [_loc6_.toString() + LocaleMgr.ins.getStr(11700025)];
               cellFashion.dataSource = [_loc3_.toString() + LocaleMgr.ins.getStr(11700026)];
            }
         }
         else
         {
            _loc14_ = _loc7_[0] as HeroInfo;
            _loc13_ = _loc7_[1] as HeroInfo;
            if(_loc14_ == null || _loc13_ == null)
            {
               this.Clear();
               return;
            }
            listBaseInfo.cells[0].dataSource = [_loc14_.baseInfo.fightValue,_loc13_.baseInfo.fightValue,_loc14_.baseInfo.fightValue.toString()];
            listBaseInfo.cells[1].dataSource = [_loc14_.baseInfo.level,_loc13_.baseInfo.level,_loc14_.baseInfo.level.toString() + LocaleMgr.ins.getStr(11700022)];
            listBaseInfo.cells[2].dataSource = [_loc14_.prop.physicalDefence,_loc13_.prop.physicalDefence,int(_loc14_.prop.physicalDefence).toString()];
            listBaseInfo.cells[3].dataSource = [_loc14_.prop.magicDefence,_loc13_.prop.magicDefence,int(_loc14_.prop.magicDefence).toString()];
            listBaseInfo.cells[4].dataSource = [_loc14_.prop.hp,_loc13_.prop.hp,int(_loc14_.prop.hp).toString()];
            listBaseInfo.cells[5].dataSource = [_loc14_.prop.attack,_loc13_.prop.attack,int(_loc14_.prop.attack).toString()];
            listBaseInfo.cells[6].dataSource = [_loc14_.prop.agility,_loc13_.prop.agility,int(_loc14_.prop.agility).toString()];
            (cellTupo as HCCellRender).xiahuaxian = true;
            cellTupo.dataSource = [StcMgr.ins.getNpcVo(_loc14_.baseInfo.baseId).tupo,StcMgr.ins.getNpcVo(_loc13_.baseInfo.baseId).tupo,StcMgr.ins.getNpcVo(_loc14_.baseInfo.baseId).tupo.toString() + LocaleMgr.ins.getStr(11700022)];
            cellJieshu.dataSource = [_loc14_.baseInfo.sjLevel,_loc13_.baseInfo.sjLevel,_loc14_.baseInfo.sjLevel.toString() + LocaleMgr.ins.getStr(11700023)];
            (cellYuanfen as HCCellRender).xiahuaxian = true;
            cellYuanfen.dataSource = [_loc14_.baseInfo.mengyue.length,_loc13_.baseInfo.mengyue.length,_loc14_.baseInfo.mengyue.length.toString() + LocaleMgr.ins.getStr(11700024)];
            cellYuanfen.toolTip = getMengYueTip(_loc14_);
            cellTupo.toolTip = new TooltipTianfuVo(_loc14_.baseInfo.baseId);
            listEquipInfo.cells[0].dataSource = [_loc14_.baseInfo.strengthLSlv,_loc13_.baseInfo.strengthLSlv,_loc14_.baseInfo.strengthLSlv.toString() + LocaleMgr.ins.getStr(11700022)];
            listEquipInfo.cells[1].dataSource = [_loc14_.baseInfo.jinglianLSLv,_loc13_.baseInfo.jinglianLSLv,_loc14_.baseInfo.jinglianLSLv.toString() + LocaleMgr.ins.getStr(11700022)];
            listBaowuInfo.cells[0].dataSource = [_loc14_.baseInfo.baowuStrLs,_loc13_.baseInfo.baowuStrLs,_loc14_.baseInfo.baowuStrLs.toString() + LocaleMgr.ins.getStr(11700022)];
            listBaowuInfo.cells[1].dataSource = [_loc14_.baseInfo.baowuFumLs,_loc13_.baseInfo.baowuFumLs,_loc14_.baseInfo.baowuFumLs.toString() + LocaleMgr.ins.getStr(11700022)];
            if(HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc14_.baseInfo.baseId) && HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc13_.baseInfo.baseId))
            {
               _loc9_ = PlayerModel.ins.playerInfo.militaryrank;
               _loc10_ = OtherRoleInfoModel.ins.military;
               _loc8_ = StcMgr.ins.getMilitaryrankVo(_loc9_);
               _loc11_ = StcMgr.ins.getMilitaryrankVo(_loc10_);
               _loc4_ = HorseService.ins.activatedHorseList.length;
               _loc6_ = OtherRoleInfoModel.ins.horseCount;
               _loc2_ = FashionModel.ins.activatedClothArr.length + FashionModel.ins.activatedWingArr.length;
               _loc3_ = OtherRoleInfoModel.ins.fashionCount;
               if(HeroModel.ins.isCurPlayerHero(_loc14_.baseInfo.id))
               {
                  cellMilitaryRank.dataSource = [!!_loc8_?_loc8_.seq:0,!!_loc11_?_loc11_.seq:0,!!_loc8_?LocaleMgr.ins.getStr(_loc8_.name):LocaleMgr.ins.getStr(999000020)];
                  cellHorse.dataSource = [_loc4_,_loc6_,_loc4_.toString() + LocaleMgr.ins.getStr(11700025)];
                  cellFashion.dataSource = [_loc2_,_loc3_,_loc2_.toString() + LocaleMgr.ins.getStr(11700026)];
               }
               else
               {
                  cellMilitaryRank.dataSource = [!!_loc11_?_loc11_.seq:0,!!_loc8_?_loc8_.seq:0,!!_loc11_?LocaleMgr.ins.getStr(_loc11_.name):LocaleMgr.ins.getStr(999000020)];
                  cellHorse.dataSource = [_loc6_,_loc4_,_loc6_.toString() + LocaleMgr.ins.getStr(11700025)];
                  cellFashion.dataSource = [_loc3_,_loc2_,_loc3_.toString() + LocaleMgr.ins.getStr(11700026)];
               }
            }
         }
      }
   }
}

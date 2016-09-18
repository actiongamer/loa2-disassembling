package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleDetailPropPanelUI;
   import proto.HeroInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.YuanFenUtil;
   import nslm2.modules.footstones.tooltipsModules.TooltipTianfuVo;
   import com.mz.core.logging.Log;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.vo.TianfuVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   
   public class RoleDetailPropPanel extends RoleDetailPropPanelUI
   {
      
      private static const _showFightValueY:int = 54;
      
      private static const _hideFightValueY:int = 4;
       
      
      public var isRoleModule:Boolean = true;
      
      private var heroInfo:HeroInfo;
      
      public function RoleDetailPropPanel()
      {
         super();
         box_content.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
      }
      
      public function show(param1:HeroInfo) : void
      {
         this.heroInfo = param1;
         setFightValue();
         setBaseInfo();
         setSkillInfo();
         setYuanFenInfo();
         setTianFuInfo();
         this.box_content.refresh();
      }
      
      private function setFightValue() : void
      {
         var _loc1_:int = Uint64Util.toInt(this.heroInfo.baseInfo.fightValue);
         if(_loc1_ != 0)
         {
            this.txt_fightValue.value = _loc1_;
            this.box_fightValueBox.visible = true;
            this.box_exceptFightValue.y = 54;
         }
         else
         {
            this.box_fightValueBox.visible = false;
            this.box_exceptFightValue.y = 4;
         }
      }
      
      private function setBaseInfo() : void
      {
         var _loc2_:Array = HeroInfoUtil.toBasePropList(this.heroInfo.prop);
         var _loc3_:Array = HeroInfoUtil.toFightPropList(this.heroInfo.prop);
         var _loc1_:Array = HeroInfoUtil.toFightPercentPropList(this.heroInfo.prop);
         this.list_propBase.dataSource = _loc2_.concat(_loc3_);
      }
      
      private function setSkillInfo() : void
      {
         var _loc1_:Array = HeroInfoUtil.getHeroAllSkillVoArr(this.heroInfo.baseInfo);
         list_skill.repeatX = _loc1_.length;
         list_skill.dataSource = _loc1_;
         list_skill.x = box_skill.width - list_skill.width >> 1;
      }
      
      private function setYuanFenInfo() : void
      {
         var _loc1_:Array = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(this.heroInfo.baseInfo.baseId),this.heroInfo.baseInfo.mengyue,HeroInfoUtil.heroBaseInfoToPanelBaseInfo(this.heroInfo.baseInfo));
         _loc1_.sort(YuanFenUtil.sortYuanfen);
         list_yuanfen.repeatY = _loc1_.length;
         list_yuanfen.dataSource = _loc1_;
         list_yuanfen.commitMeasure();
         this.box_yuanfenNext.y = this.list_yuanfen.height + this.list_yuanfen.y + 13;
      }
      
      private function setTianFuInfo() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:TooltipTianfuVo = new TooltipTianfuVo(this.heroInfo.baseInfo.baseId);
         if(_loc3_.tupoArr.length == 0)
         {
            Log.fatal(this,"缺少突破信息 stcNpcId:",this.heroInfo.baseInfo.baseId);
         }
         else
         {
            _loc1_ = [];
            _loc4_ = 0;
            while(_loc4_ <= _loc3_.totleTupoLevel)
            {
               _loc2_ = _loc3_.tupoArr[_loc4_];
               _loc5_ = new TianfuVo();
               if(_loc2_.tupo_level != 0)
               {
                  _loc5_.isActivate = _loc3_.nowTupoLevel >= _loc2_.tupo_level;
                  _loc5_.des = getDesStr(_loc2_,_loc5_.isActivate);
                  _loc1_.push(_loc5_);
               }
               _loc4_++;
            }
            list_tianfu.repeatY = _loc1_.length;
            list_tianfu.dataSource = _loc1_;
            list_tianfu.commitMeasure();
         }
      }
      
      private function getDesStr(param1:StcTupoVo, param2:Boolean) : String
      {
         var _loc3_:String = "";
         _loc3_ = _loc3_ + ("[" + LocaleMgr.ins.getStr(param1.name) + param1.tupo_level + "] " + HeroInfoUtil.getTupoDesc(param1.attr,param2) + " " + LocaleMgr.ins.getStr(30100012,[param1.tupo_level]));
         return _loc3_;
      }
      
      private function closePanel() : void
      {
         this.dispatchEvent(new Event("close"));
      }
   }
}

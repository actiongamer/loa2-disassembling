package nslm2.modules.cultivates.horse
{
   import game.ui.horseModules.HorseInfoPanelUI;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.cultivates.horse.vos.HorsePropVo;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HorseInfoPanel extends HorseInfoPanelUI
   {
       
      
      public function HorseInfoPanel()
      {
         super();
         this.txt_titlePlayerProp.toolTip = LocaleMgr.ins.getStr(30300021);
         this.txt_titleSkill.toolTip = LocaleMgr.ins.getStr(30300029);
         this.txt_titleTeamProp.toolTip = LocaleMgr.ins.getStr(30300022);
         this.icon_skill.buttonMode = true;
         this.icon_skill.needShowValidBg = true;
      }
      
      public function get fightValueBox() : FightValueBox
      {
         return this.fightValueBoxRef as FightValueBox;
      }
      
      public function refresh(param1:int, param2:Boolean = false) : void
      {
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:* = null;
         var _loc3_:Array = HorseService.ins.addAllProp();
         var _loc9_:Number = NPCPropConsts.ins.countFightValue_propArr(_loc3_);
         var _loc4_:Number = _loc9_ - this.fightValueBox.value;
         if(param2)
         {
            AlertUtil.showFightPowerChangeTip(_loc4_,fightValueChangeHandler,DisplayUtils.globarCenter(this.fightValueBox),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
         }
         else
         {
            this.fightValueBox.tweenValue = _loc9_;
         }
         var _loc11_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         var _loc7_:Array = NpcPropVo.parseArrStr(_loc11_.prop);
         if(param2)
         {
            _loc8_ = _loc7_.length;
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc5_ = _loc7_[_loc10_];
               _loc5_.floatPos = DisplayUtils.globarCenter(this.parent).add(HorseConsts.floatOffsetPoi);
               _loc10_++;
            }
         }
         this.list_playerProp.array = HorsePropVo.initFromNpcPropVoArr(_loc7_,param1);
         var _loc6_:StcSkillVo = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc11_.glory,HorseUtil.getRank(HorseService.ins.masterLevel)]);
         this.icon_skill.dataSource = !!_loc6_?_loc6_.id:0;
         this.list_teamProp.array = HorseService.ins.horseAddAllProp();
         this.txt_titlePlayerProp.text = LocaleMgr.ins.getStr(_loc11_.name) + LocaleMgr.ins.getStr(999000060);
         this.txt_titleSkill.text = LocaleMgr.ins.getStr(_loc11_.name) + LocaleMgr.ins.getStr(999000061);
         this.txt_titleTeamProp.text = LocaleMgr.ins.getStr(999000062);
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc1_:Array = HorseService.ins.horseAddAllProp();
         var _loc2_:Number = NPCPropConsts.ins.countFightValue_propArr(_loc1_);
         (this.fightValueBox as FightValueBox).tweenValue = _loc2_;
      }
   }
}

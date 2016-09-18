package nslm2.modules.cultivates.horse.horseChange
{
   import game.ui.horseModules.horseChange.HorsePropPanelUI;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.modules.cultivates.horse.HorseService;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.cultivates.horse.HorseConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HorsePropPanel extends HorsePropPanelUI
   {
       
      
      private var _nowChoosedId:int;
      
      private var _selectBtnState:int;
      
      public function HorsePropPanel()
      {
         super();
         this.txt_titleSkill.text = LocaleMgr.ins.getStr(30300017);
         this.txt_titleProp.toolTip = LocaleMgr.ins.getStr(30300028);
         this.txt_titleProp.text = LocaleMgr.ins.getStr(30300023);
      }
      
      public function show(param1:int) : void
      {
         var _loc3_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         this.icon_skill.stcSkillId = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc3_.glory,HorseUtil.getRank(HorseService.ins.masterLevel)]);
         var _loc2_:Array = NpcPropVo.parseArrStr(_loc3_.prop);
         this.list_playerProp.array = _loc2_;
         _selectBtnState = HorseService.ins.getState(param1);
         this.txt_state.text = HorseConsts.getStateName(_selectBtnState);
         this.txt_state.color = HorseConsts.getStateColor(_selectBtnState);
      }
   }
}

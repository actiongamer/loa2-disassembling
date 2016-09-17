package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.roleInfos.phaseUps.talents.PhaseUpTalentVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_player;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   
   public class TooltipStcPhaseTalent extends TooltipUICommon
   {
       
      
      public function TooltipStcPhaseTalent()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc4_:* = null;
         _loc4_ = param1 as PhaseUpTalentVo;
         var _loc3_:StcHeroTalentInfoVo = StcMgr.ins.getHeroTalentInfoVo(_loc4_.stcTablentId);
         this.box.addChild(new TooltipIconAndName_player(UrlLib.phaseUpTalentIcon(_loc3_.icon),_loc3_.lv,LocaleMgr.ins.getStr(_loc3_.name),_loc3_.ability));
         this.addVGap(10);
         if(_loc4_.lv > 0)
         {
            this.addLine();
            this.addVGap(10);
            addAttrText(_loc3_.attr);
         }
         var _loc5_:StcHeroTalentInfoVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc3_.node,_loc4_.lv + 1]) as StcHeroTalentInfoVo;
         if(_loc5_)
         {
            this.addLine();
            this.addVGap(10);
            this.addTxt(LocaleMgr.ins.getStr(30113002),458496);
            addAttrText(_loc5_.attr);
            this.addTxt(LocaleMgr.ins.getStr(30113001,[_loc3_.cond]),16046112);
         }
         else
         {
            this.addLine();
            this.addVGap(10);
            this.addTxt(LocaleMgr.ins.getStr(30113003),16046112);
         }
         this.validateSize();
      }
      
      private function addAttrText(param1:String) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:Array = NpcPropVo.parseArrStr(param1);
         var _loc2_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc5_ = _loc4_[_loc6_] as NpcPropVo;
            _loc3_ = NPCPropConsts.ins.getLocaleName(_loc5_.propId) + " + " + _loc5_.value;
            this.addTxt(_loc3_,458496);
            _loc6_++;
         }
      }
   }
}

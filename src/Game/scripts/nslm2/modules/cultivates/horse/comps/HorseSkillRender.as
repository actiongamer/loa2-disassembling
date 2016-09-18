package nslm2.modules.cultivates.horse.comps
{
   import game.ui.horseModules.horseMaster.HorseSkillRenderUI;
   import nslm2.modules.cultivates.horse.vos.HorseSkillVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class HorseSkillRender extends HorseSkillRenderUI
   {
       
      
      private var _horseSkillVo:HorseSkillVo;
      
      public function HorseSkillRender()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().init(this.arrowUp));
         this.needShowValidBg = true;
      }
      
      public function get horseSkillVo() : HorseSkillVo
      {
         return _horseSkillVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _horseSkillVo = param1 as HorseSkillVo;
            if(StcMgr.ins.getHorsejingtongVo(_horseSkillVo.masterLevel - 1).skilltype == 2)
            {
               this.box_skill.visible = true;
               this.txt_desc.y = 60;
               this.txt_desc.text = LocaleMgr.ins.getStr(30300038);
               _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_horseSkillVo.skillId,HorseUtil.getRank(_horseSkillVo.masterLevel)]);
               if(_loc2_)
               {
                  .super.dataSource = _loc2_.id;
                  this.arrowUp.visible = true;
               }
               else
               {
                  .super.dataSource = 0;
                  this.toolTip = LocaleMgr.ins.getStr(30300024);
                  this.arrowUp.visible = false;
               }
            }
            else
            {
               this.box_skill.visible = false;
               this.txt_desc.y = 0;
               this.txt_desc.text = LocaleMgr.ins.getStr(30300039);
            }
         }
      }
   }
}

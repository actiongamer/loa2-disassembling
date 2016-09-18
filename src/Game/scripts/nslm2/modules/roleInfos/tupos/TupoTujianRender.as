package nslm2.modules.roleInfos.tupos
{
   import game.ui.roleInfos.tupos.TupoTujianRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   
   public class TupoTujianRender extends TupoTujianRenderUI
   {
       
      
      public function TupoTujianRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            _loc4_ = param1 as StcTupoVo;
            _loc2_ = RoleTupoUtil.getStcTupoVo(_loc4_.hero_node,_loc4_.tupo_level - 1);
            this.txt_activate.text = LocaleMgr.ins.getStr(999000514,[TextFieldUtil.htmlText2(_loc4_.tupo_level,458496)]);
            _loc5_ = TextFieldUtil.htmlText2("[" + LocaleMgr.ins.getStr(_loc4_.name) + _loc4_.tupo_level + "] " + HeroInfoUtil.getTupoDesc(_loc4_.attr),458496);
            _loc3_ = RoleTupoUtil.getUnlockSkillId(_loc4_.id);
            if(_loc3_ != 0)
            {
               _loc5_ = _loc5_ + LocaleMgr.ins.getStr(999000556);
            }
            this.render_unlockSkill.dataSource = _loc3_;
            this.txt_addProp.text = _loc5_;
            this.render_unlockSkill.x = this.txt_addProp.x + this.txt_addProp.textWidth + 10;
            this.list_needItem.dataSource = RoleTupoUtil.getTupoNeedMaterial(_loc4_);
         }
      }
   }
}

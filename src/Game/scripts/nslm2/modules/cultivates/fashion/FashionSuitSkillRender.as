package nslm2.modules.cultivates.fashion
{
   import game.ui.fashionModules.FashionSuitSkillRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.FilterUtil;
   
   public class FashionSuitSkillRender extends FashionSuitSkillRenderUI
   {
       
      
      public function FashionSuitSkillRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_skillNum.text = this.listCellVo.listIndex + 1 + "/2 ";
            this.txt_skillName.text = LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(param1 as int).name);
         }
         if(FashionModel.ins.hasSkill(param1 as int))
         {
            this.filters = null;
         }
         else
         {
            this.filters = [FilterUtil.grayFilter()];
         }
         this.toolTip = StcMgr.ins.getSkillVo(param1 as int);
      }
   }
}

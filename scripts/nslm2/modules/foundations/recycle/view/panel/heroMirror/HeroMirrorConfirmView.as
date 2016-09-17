package nslm2.modules.foundations.recycle.view.panel.heroMirror
{
   import game.ui.recycleModules.heroMirror.HeroMirrorConfirmViewUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HeroMirrorConfirmView extends HeroMirrorConfirmViewUI
   {
       
      
      public function HeroMirrorConfirmView(param1:Array, param2:Array, param3:Array)
      {
         super();
         this.costList.dataSource = param1;
         this.rewardList.dataSource = param2;
         this.list_cost.dataSource = param3;
         this.txt_30609005.text = LocaleMgr.ins.getStr(30609005);
         this.txt_109001016.text = LocaleMgr.ins.getStr(109001016);
      }
   }
}

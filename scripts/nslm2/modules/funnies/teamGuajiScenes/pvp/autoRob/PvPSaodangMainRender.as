package nslm2.modules.funnies.teamGuajiScenes.pvp.autoRob
{
   import game.ui.teamGuajiScenes.pvp.saodang.PvPSaoDangMainRenderUI;
   import nslm2.modules.Chapters.saodang.SaodangVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PvPSaodangMainRender extends PvPSaoDangMainRenderUI
   {
       
      
      private var data:SaodangVo;
      
      public function PvPSaodangMainRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         data = param1 as SaodangVo;
         if(data)
         {
            this.txt_title.text = LocaleMgr.ins.getStr(999001134,[data.index]);
            list_item.dataSource = data.addItemsArr;
         }
         .super.dataSource = param1;
      }
   }
}

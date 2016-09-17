package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RandomPropRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RandomPorpRender extends RandomPropRenderUI
   {
       
      
      public function RandomPorpRender()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.showTxtName(LocaleMgr.ins.getStr(2000000000 + vo.propId));
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      override public function validateTooltip() : void
      {
         this.toolTip = null;
      }
   }
}

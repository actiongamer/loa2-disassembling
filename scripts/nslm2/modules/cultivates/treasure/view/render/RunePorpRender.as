package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RunePorpRenderUI;
   import nslm2.common.consts.NPCPropConsts;
   
   public class RunePorpRender extends RunePorpRenderUI
   {
       
      
      public function RunePorpRender()
      {
         super();
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.showTxtName(NPCPropConsts.ins.getLocaleNameNormal(vo.propId));
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      override public function get width() : Number
      {
         return this.txt_name.textWidth + this.txt_value.textWidth + 10;
      }
   }
}

package nslm2.modules.cultivates.fashion
{
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class FashionPropTwoRender extends FashionPropTwoRenderUI
   {
       
      
      public function FashionPropTwoRender()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().init(this.img_arrowUp));
      }
      
      override public function validateValue2() : void
      {
         if(this.ref_txt_value2)
         {
            if(vo && !isNaN(vo.valueNext) && vo.valueNext != 0)
            {
               showValue2();
               this.img_arrowUp.visible = true;
               this.hbox_value.refresh();
            }
            else
            {
               this.ref_txt_value2.text = "";
               this.img_arrowUp.visible = false;
            }
         }
      }
      
      override public function showName() : void
      {
         this.ref_txt_name.text = NPCPropConsts.ins.getLocaleNameShort(vo.propId) + ":";
      }
   }
}

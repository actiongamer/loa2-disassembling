package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.fashionModules.FashionPropTwoRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class PetSkinPropTwoRender extends FashionPropTwoRenderUI
   {
       
      
      public function PetSkinPropTwoRender()
      {
         super();
         this.parts.push(new FloatUpDownEffCtrl().init(this.img_arrowUp));
      }
      
      override public function validateName() : void
      {
         super.validateName();
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               if(vo.propId != 20)
               {
                  this.ref_txt_name.text = LocaleMgr.ins.getStr(32000057 + vo.propId,[int(vo.value)]);
                  this.hbox_value.x = 57;
               }
               else
               {
                  this.ref_txt_name.text = LocaleMgr.ins.getStr(32000068,[vo.value]);
                  this.hbox_value.x = 82;
               }
               this.ref_txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId) + ":";
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
         if(!this.ref_txt_value)
         {
         }
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
               if(vo.propId != 20)
               {
               }
            }
            else
            {
               this.ref_txt_value2.text = "";
               this.img_arrowUp.visible = false;
            }
         }
      }
   }
}

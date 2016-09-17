package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.commons.comps.others.PetPosBuffListRenderUI;
   import nslm2.modules.cultivates.pet.vo.PetPosBuffVo;
   import nslm2.common.consts.NPCPropConsts;
   
   public class PetPosBuffListRender extends PetPosBuffListRenderUI
   {
       
      
      private var _data:PetPosBuffVo;
      
      public function PetPosBuffListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as PetPosBuffVo;
         .super.dataSource = param1;
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.ref_txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId) + "： ";
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
   }
}

package morn.customs.components
{
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.pet.model.PetModel;
   
   public class PetRender extends WealthRender
   {
       
      
      private var _petInfoVo:PetInfoVo;
      
      public function PetRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1)
         {
            if(param1 is PetInfoVo)
            {
               _petInfoVo = param1 as PetInfoVo;
               .super.dataSource = WealthUtil.createNpcVo((param1 as PetInfoVo).id);
               if((param1 as PetInfoVo).id > 0)
               {
                  this.toolTip = _petInfoVo;
               }
               else
               {
                  this.toolTip = null;
               }
            }
            else
            {
               .super.dataSource = param1;
            }
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      override protected function validateListStars() : void
      {
         var _loc1_:* = null;
         if(this.ref_list_Stars)
         {
            ref_list_Stars.visible = false;
            if(ref_lable_Stars)
            {
               ref_lable_Stars.visible = false;
            }
            if(_petInfoVo && _petInfoVo.petInfo)
            {
               if(FuncOpenAutoCtrl.checkOpen(32000) && _petInfoVo.petInfo)
               {
                  ref_list_Stars.visible = true;
                  _loc1_ = PetModel.getStarLightArray(_petInfoVo.petInfo.star,true);
                  updateStars(_loc1_);
               }
            }
         }
      }
   }
}

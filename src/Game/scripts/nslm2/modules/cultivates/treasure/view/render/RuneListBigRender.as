package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RuneListBigRenderUI;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   
   public class RuneListBigRender extends RuneListBigRenderUI
   {
       
      
      public function RuneListBigRender()
      {
         super();
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         this.buttonMode = true;
         if(this.ref_img_quality.visible == false)
         {
            buttonMode = false;
            this.ref_img_quality.skin = this.ori_img_quality_skin + 0;
            this.ref_img_quality.visible = true;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         .super.dataSource = param1;
         this.box_icon.disabled = false;
         if(wealthVo && wealthVo.stcItemVo)
         {
            _loc2_ = TreasureUtil.getAddtionType(wealthVo.sid);
            if(TreasureModel.ins.selectedTreasure)
            {
               if(TreasureModel.ins.crtTreasureRuneTypes.indexOf(_loc2_) >= 0)
               {
                  this.box_icon.disabled = true;
               }
            }
         }
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 > 1 || wealthVo.useStcCount)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + param1;
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
   }
}

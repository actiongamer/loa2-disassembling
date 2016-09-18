package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RuneBgListRenderUI;
   import com.mz.core.mgrs.IDragDropSource;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.bag.RenderSellState;
   import morn.core.components.Label;
   import com.mz.core.mgrs.RDragDropMgr;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.Uint64Util;
   import morn.customs.FilterLib;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import com.mz.core.mediators.RollMediator;
   
   public class RuneBagListRender extends RuneBgListRenderUI implements IDragDropSource
   {
       
      
      public var renderSellState:RenderSellState;
      
      private var starNum:Label;
      
      public function RuneBagListRender()
      {
         starNum = new Label();
         super();
         this.parts.push(new RollMediator(this,rollHandler));
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         if(param1 && this.wealthVoIsEnable)
         {
            this.img_icon.filters = [FilterUtil.getLightFilter(0.2)];
            this.img_quality.filters = [FilterUtil.getLightFilter(0.2)];
         }
         else
         {
            this.img_icon.filters = null;
            this.img_quality.filters = null;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         validateSellState();
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
      
      public function validateSellState() : void
      {
         var _loc1_:* = undefined;
         RDragDropMgr.getInstance.switchDragListen(this,false);
         if(renderSellState)
         {
            _loc1_ = renderSellState.waitingSellIdArr;
            if(renderSellState.isSell)
            {
               if(this.wealthVoIsEnable)
               {
                  if(WealthUtil.isCanSell(wealthVo.stcItemVo.sell_price))
                  {
                     if(_loc1_ && Uint64Util.indexOfArray(_loc1_,this.wealthVo.item.id) > -1)
                     {
                        this.filters = FilterLib.ins.getFilterArr(402);
                     }
                     else
                     {
                        RDragDropMgr.getInstance.switchDragListen(this,true);
                        this.filters = null;
                     }
                  }
                  else
                  {
                     this.filters = FilterLib.ins.getFilterArr(402);
                  }
               }
               else
               {
                  this.filters = null;
               }
            }
            else
            {
               this.filters = null;
            }
         }
         else
         {
            this.filters = null;
         }
      }
      
      public function onDragStart() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            if(this.img_icon.bitmapData)
            {
               _loc1_ = this.img_icon;
            }
            else
            {
               _loc1_ = this.img_quality;
            }
            RDragDropMgr.getInstance.start(_loc1_.bitmapData.clone(),"BAG_SELL_BATCH",this,_loc1_.mouseX,_loc1_.mouseY);
         }
      }
      
      public function flyFrom(param1:Image) : void
      {
         IconFlyEff.createFlyTo(param1,this.img_icon).exec();
      }
   }
}

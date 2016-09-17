package nslm2.modules.bag
{
   import game.ui.BagModules.BagItemRenderUI;
   import com.mz.core.mgrs.IDragDropSource;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.Item;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import morn.core.components.Label;
   import com.mz.core.mgrs.RDragDropMgr;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.Uint64Util;
   import morn.customs.FilterLib;
   import com.mz.core.utils.FilterUtil;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mediators.RollMediator;
   
   public class BagItemRender extends BagItemRenderUI implements IDragDropSource
   {
       
      
      private var redPoint:RedPoint;
      
      public var renderSellState:nslm2.modules.bag.RenderSellState;
      
      private var starNum:Label;
      
      public function BagItemRender()
      {
         starNum = new Label();
         super();
         this.img_new.visible = false;
         this.img_new.text = LocaleMgr.ins.getStr("999902581");
         this.parts.push(new RollMediator(this,rollHandler));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = undefined;
         .super.dataSource = param1;
         if(this.wealthVoIsEnable)
         {
            _loc2_ = BagModel.ins.newItemArr;
            if(_loc2_.indexOf(this.wealthVo.item) > -1)
            {
               this.img_new.visible = true;
               switchRedPoint(false);
            }
            else
            {
               this.img_new.visible = false;
               if((wealthVo.stcItemVo.kind == 51 || wealthVo.stcItemVo.kind == 72 || wealthVo.stcItemVo.kind == 52 && !PetModel.ins.getPetInfo(int(wealthVo.stcItemVo.extend_2))) && wealthVo.item.count >= wealthVo.stcItemVo.equipPieceComposeCount)
               {
                  switchRedPoint(true);
               }
               else
               {
                  switchRedPoint(false);
               }
            }
         }
         else
         {
            list_stars.visible = false;
            this.starNum.visible = false;
            this.img_new.visible = false;
            switchRedPoint(false);
         }
         validateSellState();
      }
      
      private function switchRedPoint(param1:Boolean) : void
      {
         if(param1)
         {
            if(redPoint == null)
            {
               redPoint = new RedPoint();
               this.addChild(redPoint);
               redPoint.right = -4;
               redPoint.top = -4;
            }
            redPoint.visible = true;
         }
         else if(redPoint != null)
         {
            redPoint.visible = false;
         }
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 > 1)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + param1;
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         if(this.ref_img_quality.visible == false)
         {
            this.ref_img_quality.skin = this.ori_img_quality_skin + 0;
            this.ref_img_quality.visible = true;
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
      
      private function rollHandler(param1:Boolean) : void
      {
         if(param1 && this.wealthVoIsEnable && (this.filters == null || this.filters.length == 0))
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
      
      override protected function validateImgIcon() : void
      {
         super.validateImgIcon();
      }
      
      override public function dispose() : void
      {
         RDragDropMgr.getInstance.switchDragListen(this,false);
         super.dispose();
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

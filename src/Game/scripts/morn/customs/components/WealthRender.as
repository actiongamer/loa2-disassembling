package morn.customs.components
{
   import morn.core.components.View;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IDelayRefresh;
   import nslm2.modules.bag.itemModuels.BagConsts;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import com.mz.core.event.MzEvent;
   import morn.core.components.HBox;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.vo.PlayerDiamondVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.LabelUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import proto.Item;
   import nslm2.common.event.WealthChangeEvent;
   import morn.core.utils.NumberUtil;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   
   public class WealthRender extends View implements IObserver, IDelayRefresh
   {
      
      public static const IMG_ICON:String = "img_icon";
      
      public static const IMG_QUALITY:String = "img_quality";
      
      public static const TXT_NUM:String = "txt_num";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const TXT_COUNT_AND_NEED:String = "txt_countAndNeed";
      
      public static const TXT_NEEDNUM:String = "txt_needNum";
      
      public static const HBOX_NUM:String = "hbox_num";
      
      public static const TXT_ADDNUM:String = "txt_addNum";
      
      public static const TXT_NAME_AND_COUNT:String = "txt_nameAndCount";
      
      public static const TXT_HASNUM:String = "txt_hasNum";
      
      public static const LIST_STARTS:String = "list_stars";
      
      public static const TXT_STAR_CNT:String = "txt_star_cnt";
      
      public static const REFRESH:String = "REFRESH";
       
      
      public var needShowValidBg:Boolean;
      
      public var needShowZero:Boolean;
      
      public var isPlayerDiamond:Boolean = false;
      
      private var _showMultipleSign:Boolean = false;
      
      public var ori_img_quality_skin:String;
      
      private var icon_equipPieceMask:Image;
      
      protected var icon_pieceTip:Image;
      
      public var isLock:Boolean = false;
      
      protected var oldNum:Number;
      
      protected var newNum:Number;
      
      private var _tweenNumValue:Number;
      
      public function WealthRender()
      {
         super();
         if(this.ref_img_quality)
         {
            ori_img_quality_skin = this.ref_img_quality.skin.substr(0,this.ref_img_quality.skin.length - 1);
         }
      }
      
      public static function checkIsPieceType(param1:int) : Boolean
      {
         return BagConsts.PIECE_TYPE_ARRAY.indexOf(param1) >= 0;
      }
      
      public function get ref_img_icon() : Image
      {
         return getRef("img_icon");
      }
      
      public function get ref_img_quality() : Image
      {
         return getRef("img_quality");
      }
      
      public function get ref_txt_num() : Label
      {
         return getRef("txt_num");
      }
      
      public function get ref_txt_name() : Label
      {
         return getRef("txt_name");
      }
      
      public function get ref_txt_countAndNeed() : Label
      {
         return getRef("txt_countAndNeed");
      }
      
      public function get ref_txt_nameAndCount() : Label
      {
         return getRef("txt_nameAndCount");
      }
      
      public function get ref_txt_hasNum() : Label
      {
         return getRef("txt_hasNum");
      }
      
      public function get ref_list_Stars() : List
      {
         return getRef("list_stars");
      }
      
      public function get ref_lable_Stars() : Label
      {
         return getRef("txt_star_cnt");
      }
      
      public function refreshData() : void
      {
         refreshLockBefore();
         validateAll();
         refreshLockAfter();
         dispatchEvent(new MzEvent("REFRESH"));
      }
      
      public function get ref_txt_needNum() : Label
      {
         return getRef("txt_needNum");
      }
      
      public function get ref_hbox_num() : HBox
      {
         return getRef("hbox_num");
      }
      
      public function get ref_txt_addNum() : Label
      {
         return getRef("txt_addNum");
      }
      
      protected function getRef(param1:String) : *
      {
         if(this.hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get wealthVo() : WealthVo
      {
         return dataSource as WealthVo;
      }
      
      public function set wealthVo(param1:WealthVo) : void
      {
         this.dataSource = param1;
      }
      
      public function get wealthVoIsEnable() : Boolean
      {
         return wealthVo && wealthVo.kind != 0;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.validateAll();
      }
      
      protected function validateAll() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.validateObserver();
         this.validateImgIcon();
         this.validateTooltip();
         this.validateTxtName();
         this.validateTxtNum();
         this.validateTxtHasNum();
         this.validateIconMask();
         this.validateQuality();
         this.validateTxtEffect();
         this.validateListStars();
      }
      
      public function get showMultipleSign() : Boolean
      {
         return _showMultipleSign;
      }
      
      public function set showMultipleSign(param1:Boolean) : void
      {
         _showMultipleSign = param1;
         this.callLater(validateTxtNum);
      }
      
      protected function validateObserver() : void
      {
         if(wealthVo && wealthVo.kind != 0 && wealthVo.useStcCount)
         {
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      protected function validateImgIcon() : void
      {
         if(this.ref_img_icon != null)
         {
            if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
            {
               ref_img_icon.smoothing = true;
               this.ref_img_icon.url = wealthVo.iconUrl(this.ref_img_icon.width);
            }
            else
            {
               this.ref_img_icon.url = null;
            }
         }
      }
      
      protected function validateTooltip() : void
      {
         var _loc1_:* = null;
         if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
         {
            if(isPlayerDiamond && wealthVo.kind == 3)
            {
               _loc1_ = new PlayerDiamondVo();
               this.toolTip = _loc1_;
            }
            else
            {
               this.toolTip = WealthUtil.tooltip(wealthVo);
            }
         }
         else
         {
            this.toolTip = null;
         }
      }
      
      public function refershNum() : void
      {
         this.validateTxtNum();
      }
      
      protected function validateTxtNum() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.ref_txt_countAndNeed != null)
         {
            if(wealthVoIsEnable)
            {
               _loc2_ = wealthVo.need;
               _loc1_ = PlayerModel.ins.getCountByWealthVo(wealthVo);
               ref_txt_countAndNeed.visible = true;
               ref_txt_countAndNeed.text = _loc1_ + "/" + _loc2_;
               ref_txt_countAndNeed.color = LabelUtils.getCountNeedColor(_loc1_,_loc2_);
            }
            else
            {
               ref_txt_countAndNeed.visible = false;
            }
         }
         else if(this.ref_txt_needNum != null)
         {
            if(wealthVoIsEnable)
            {
               _loc2_ = wealthVo.need;
               _loc1_ = PlayerModel.ins.getCountByWealthVo(wealthVo);
               if(_loc2_)
               {
                  this.ref_txt_needNum.text = _loc2_.toString();
                  this.ref_txt_needNum.color = LabelUtils.getCountNeedColor(_loc1_,_loc2_);
                  this.ref_txt_needNum.visible = true;
                  if(ref_txt_num != null)
                  {
                     ref_txt_num.visible = true;
                     this.ref_txt_num.text = _loc1_.toString();
                     this.ref_txt_num.visible = true;
                     this.ref_txt_num.color = LabelUtils.getCountNeedColor(_loc1_,_loc2_);
                  }
                  if(this.ref_hbox_num != null)
                  {
                     this.ref_hbox_num.refresh();
                     this.changeSize();
                  }
               }
               else
               {
                  if(ref_txt_num != null)
                  {
                     ref_txt_num.visible = false;
                  }
                  this.ref_txt_needNum.visible = false;
               }
            }
            else
            {
               if(ref_txt_num != null)
               {
                  ref_txt_num.visible = false;
               }
               this.ref_txt_needNum.visible = false;
            }
         }
         else if(this.ref_txt_num != null)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               showTxtNum(wealthVo.showCount);
            }
            else
            {
               ref_txt_num.visible = false;
            }
         }
      }
      
      protected function validateTxtHasNum() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = NaN;
         if(this.ref_txt_hasNum != null)
         {
            if(wealthVoIsEnable)
            {
               _loc2_ = wealthVo.showCount;
               _loc1_ = PlayerModel.ins.getCountByWealthVo(wealthVo);
               ref_txt_hasNum.visible = true;
               ref_txt_hasNum.text = _loc1_.toString();
               ref_txt_hasNum.color = LabelUtils.getCountNeedColor(_loc1_,_loc2_);
            }
            else
            {
               ref_txt_hasNum.visible = false;
            }
         }
      }
      
      protected function showTxtNum(param1:Number) : void
      {
         if(param1 || wealthVo.useStcCount || needShowZero)
         {
            this.ref_txt_num.text = (!!this.showMultipleSign?"x":"") + param1;
            this.ref_txt_num.visible = true;
         }
         else
         {
            this.ref_txt_num.visible = false;
         }
      }
      
      protected function validateTxtName() : void
      {
         if(this.ref_txt_nameAndCount != null)
         {
            if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
            {
               this.ref_txt_nameAndCount.text = TextFieldUtil.htmlText2(wealthVo.showName,ColorLib.qualityColor(wealthVo.quality)) + (!!this.showMultipleSign?"x":"") + wealthVo.showCount;
               this.ref_txt_nameAndCount.visible = true;
            }
            else
            {
               this.ref_txt_nameAndCount.visible = false;
            }
         }
         else if(this.ref_txt_name != null)
         {
            if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
            {
               this.ref_txt_name.color = ColorLib.qualityColor(wealthVo.quality);
               this.ref_txt_name.text = wealthVo.showName;
               this.ref_txt_name.visible = true;
            }
            else
            {
               this.ref_txt_name.visible = false;
            }
         }
      }
      
      protected function validateIconMask() : void
      {
         if(ref_img_icon)
         {
            if(this.wealthVoIsEnable)
            {
               if(wealthVo.kind == 20)
               {
                  if(wealthVo.stcItemVo && checkIsPieceType(wealthVo.stcItemVo.kind))
                  {
                     if(icon_equipPieceMask == null && ref_img_icon)
                     {
                        icon_equipPieceMask = new Image("png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_mask");
                        icon_equipPieceMask.x = ref_img_icon.x;
                        icon_equipPieceMask.y = ref_img_icon.y;
                        icon_equipPieceMask.scaleX = ref_img_icon.scaleX;
                        icon_equipPieceMask.scaleY = ref_img_icon.scaleY;
                        icon_equipPieceMask.anchorX = ref_img_icon.anchorX;
                        icon_equipPieceMask.anchorY = ref_img_icon.anchorY;
                        icon_equipPieceMask.width = ref_img_icon.width;
                        icon_equipPieceMask.height = ref_img_icon.height;
                        icon_equipPieceMask.cacheAsBitmap = true;
                        DisplayUtils.addChildAbove(icon_equipPieceMask,ref_img_icon);
                        icon_equipPieceMask.mouseEvent = false;
                     }
                     showEquipPieceMaskAndIcon();
                     if(this.ref_img_icon.width > 40)
                     {
                        showPieceTip();
                     }
                     else
                     {
                        showPieceTip(null,16,16);
                     }
                  }
                  else
                  {
                     hideEquipPieceMaskAndIcon();
                  }
               }
               else
               {
                  hideEquipPieceMaskAndIcon();
               }
            }
            else
            {
               hideEquipPieceMaskAndIcon();
            }
         }
      }
      
      protected function showEquipPieceMaskAndIcon() : void
      {
         if(icon_equipPieceMask)
         {
            icon_equipPieceMask.visible = true;
            this.ref_img_icon.cacheAsBitmap = true;
            this.ref_img_icon.mask = icon_equipPieceMask;
         }
      }
      
      protected function hideEquipPieceMaskAndIcon() : void
      {
         if(icon_equipPieceMask != null && this.ref_img_icon.mask == icon_equipPieceMask)
         {
            icon_equipPieceMask.visible = false;
            this.ref_img_icon.mask = null;
         }
         if(icon_pieceTip != null)
         {
            icon_pieceTip.visible = false;
         }
      }
      
      protected function showPieceTip(param1:String = null, param2:int = 26, param3:int = 26) : void
      {
         if(icon_pieceTip == null)
         {
            if(param1 == null)
            {
               param1 = UrlLib.piece_tip();
            }
            icon_pieceTip = new Image(param1);
            icon_pieceTip.width = param2;
            icon_pieceTip.height = param3;
            icon_pieceTip.scaleX = ref_img_icon.scaleX <= 0.7?ref_img_icon.scaleX + 0.3:Number(ref_img_icon.scaleX);
            icon_pieceTip.scaleY = ref_img_icon.scaleY <= 0.7?ref_img_icon.scaleY + 0.3:Number(ref_img_icon.scaleY);
            icon_pieceTip.anchorX = ref_img_icon.anchorX;
            icon_pieceTip.anchorY = ref_img_icon.anchorY;
            icon_pieceTip.x = (ref_img_icon.x + ref_img_icon.width - param2 + 2) * ref_img_icon.scaleX;
            icon_pieceTip.y = (ref_img_icon.y - 2) * ref_img_icon.scaleY;
            icon_pieceTip.smoothing = true;
            this.addChild(icon_pieceTip);
         }
         if(icon_pieceTip.skin != param1)
         {
            icon_pieceTip.skin == param1;
            icon_pieceTip.width = param2;
            icon_pieceTip.height = param3;
         }
         icon_pieceTip.visible = true;
      }
      
      protected function validateQuality() : void
      {
         if(this.ref_img_quality && this.ori_img_quality_skin)
         {
            if(wealthVo && wealthVo.kind != 0)
            {
               if(wealthVo.stcItemVo && checkIsPieceType(wealthVo.stcItemVo.kind))
               {
                  this.ref_img_quality.skin = "png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_" + wealthVo.quality;
               }
               else
               {
                  this.ref_img_quality.skin = ori_img_quality_skin + wealthVo.quality;
               }
               ref_img_quality.visible = true;
            }
            else
            {
               ref_img_quality.skin = ori_img_quality_skin + 1;
               ref_img_quality.visible = needShowValidBg;
            }
         }
      }
      
      protected function validateTxtEffect() : void
      {
         if(this.ref_txt_addNum && wealthVo)
         {
            this.ref_txt_addNum.text = LocaleMgr.ins.getStr(3011) + TextFieldUtil.htmlText2(wealthVo.stcItemVo.extend_1.toString(),ColorLib.qualityColor(wealthVo.stcItemVo.quality));
         }
      }
      
      protected function validateListStars() : void
      {
         var _loc1_:* = null;
         if(this.ref_list_Stars)
         {
            ref_list_Stars.visible = false;
            if(ref_lable_Stars)
            {
               ref_lable_Stars.visible = false;
            }
            if(wealthVo && (wealthVo.item || wealthVo.treasure || wealthVo.petInfo))
            {
               if(wealthVo.item && BagConsts.EQUIP_PLACE.indexOf(wealthVo.stcItemVo.kind) != -1)
               {
                  if(FuncOpenAutoCtrl.checkOpen(30502) && wealthVo.item && wealthVo.item.star > 0)
                  {
                     ref_list_Stars.visible = true;
                     _loc1_ = EquipGrowModel.getStarLightArray(wealthVo.item.star,wealthVo.stcItemVo.quality);
                     updateStars(_loc1_);
                  }
               }
               if(wealthVo.treasure)
               {
                  if(FuncOpenAutoCtrl.checkOpen(30609) && wealthVo.treasure && wealthVo.treasure.keyin > 0)
                  {
                     ref_list_Stars.visible = true;
                     _loc1_ = TreasureModel.getStarLightArray(wealthVo.treasure.keyin,true);
                     updateStars(_loc1_);
                  }
               }
               if(wealthVo.petInfo)
               {
                  if(FuncOpenAutoCtrl.checkOpen(32030) && wealthVo.petInfo && wealthVo.petInfo.star > 0)
                  {
                     ref_list_Stars.visible = true;
                     _loc1_ = PetModel.getStarLightArray(wealthVo.petInfo.star,true);
                     updateStars(_loc1_);
                  }
               }
            }
         }
      }
      
      protected function updateStars(param1:Array) : void
      {
         ref_list_Stars.visible = true;
         if(param1.length > 5)
         {
            this.ref_list_Stars.repeatX = 1;
            this.ref_list_Stars.x = ref_img_icon.x + (ref_img_icon.width - ref_list_Stars.width * ref_list_Stars.scale) * 0.5 - 4;
            if(ref_lable_Stars)
            {
               ref_lable_Stars.visible = true;
               ref_lable_Stars.text = "x" + param1.length;
               ref_lable_Stars.x = int(ref_list_Stars.x + 12);
            }
         }
         else
         {
            if(ref_lable_Stars)
            {
               ref_lable_Stars.visible = false;
            }
            this.ref_list_Stars.repeatX = param1.length;
            this.ref_list_Stars.x = ref_img_icon.x + (ref_img_icon.width - ref_list_Stars.width * ref_list_Stars.scale) * 0.5;
         }
         ref_list_Stars.dataSource = param1;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_item_num_change","wealthChange"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(wealthVo == null || wealthVo.useStcCount == false)
         {
            ObserverMgr.ins.unregObserver(this);
            return;
         }
         if(isLock)
         {
            return;
         }
         var _loc5_:* = param1;
         if("msg_item_num_change" !== _loc5_)
         {
            if("wealthChange" === _loc5_)
            {
               _loc4_ = param2 as WealthChangeEvent;
               if(this.wealthVo.kind == _loc4_.wealthType || this.wealthVo.kind == 3 && (_loc4_.wealthType == 3 || _loc4_.wealthType == 4))
               {
                  this.validateTxtNum();
                  this.validateTxtName();
                  this.validateTooltip();
               }
            }
         }
         else
         {
            _loc3_ = param2 as Item;
            if(this.wealthVo.kind == 20 && this.wealthVo.sid == _loc3_.itemId)
            {
               this.validateTxtNum();
               this.validateTxtName();
            }
         }
      }
      
      protected function refreshLockBefore() : void
      {
         if(this.ref_txt_num)
         {
            if(NumberUtil.isNumber(this.ref_txt_num.text))
            {
               oldNum = Number(this.ref_txt_num.text);
            }
         }
      }
      
      protected function refreshLockAfter() : void
      {
         if(wealthVo)
         {
            if(this.ref_txt_num)
            {
               if(NumberUtil.isNumber(this.ref_txt_num.text))
               {
                  tweenNumValue = oldNum;
                  newNum = wealthVo.showCount;
                  if(oldNum != newNum)
                  {
                     TweenLite.to(this,0.5,{
                        "tweenNumValue":newNum,
                        "overwrite":2,
                        "onComplete":tweenNumValueCpl
                     });
                  }
               }
            }
         }
      }
      
      public function get tweenNumValue() : Number
      {
         return _tweenNumValue;
      }
      
      public function set tweenNumValue(param1:Number) : void
      {
         if(_tweenNumValue != param1)
         {
            _tweenNumValue = param1;
            this.ref_txt_num.text = param1.toFixed(0);
         }
      }
      
      private function tweenNumValueCpl() : void
      {
         this.ref_txt_num.text = String(newNum);
      }
      
      public function get targetObject() : DisplayObject
      {
         return this.ref_img_icon;
      }
   }
}

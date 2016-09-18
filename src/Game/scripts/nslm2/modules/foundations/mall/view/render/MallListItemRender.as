package nslm2.modules.foundations.mall.view.render
{
   import game.ui.mallModule.render.MallListItemRenderUI;
   import nslm2.modules.foundations.mall.vo.MallItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.foundations.mall.util.MallUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.SkinLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class MallListItemRender extends MallListItemRenderUI
   {
       
      
      private var _data:MallItemVo;
      
      private var raw_X:int;
      
      public function MallListItemRender()
      {
         super();
         btn_buy.clickHandler = doBuy;
         raw_X = txt_name.x;
         if(ClientConfig.isRuLang())
         {
            this.txt_name.size = 12;
            this.txt_status.size = 12;
            this.txt_status.y = this.txt_status.y + 2;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc8_:* = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:* = 0;
         var _loc3_:Number = NaN;
         var _loc6_:int = 0;
         _data = param1 as MallItemVo;
         if(_data)
         {
            _loc8_ = WealthUtil.parseCostStr(_data.stcMallItemVo.items);
            this.txt_name.color = ColorLib.qualityColor(_loc8_.quality);
            this.txt_name.text = _loc8_.showName;
            this.itemRender.dataSource = _loc8_;
            this.oriRes.dataSource = WealthUtil.parseCostStr(_data.stcMallItemVo.old_price,true);
            this.priceRender.dataSource = _data.price;
            img_statusBg.visible = false;
            txt_status.text = "";
            if(!_data.stcMallItemVo.old_price || priceRender.dataSource.count == oriRes.dataSource.count)
            {
               oriRes.visible = false;
               img_saleLine.visible = false;
            }
            else
            {
               oriRes.visible = true;
               img_saleLine.visible = true;
            }
            _loc5_ = MallUtil.getBuyLimit(_data.stcMallItemVo,2);
            _loc2_ = MallUtil.getBuyLimit(_data.stcMallItemVo,1);
            _loc7_ = _loc8_.count;
            if(_loc5_)
            {
               _loc7_ = _loc5_ - _data.buyCountGlobal;
               _loc4_ = uint(_loc7_ > 0?458496:16723968);
               this.txt_count.text = LocaleMgr.ins.getStr(999000303) + TextFieldUtil.htmlText2(_loc7_ + "/" + _loc5_,_loc4_);
            }
            if(_loc2_)
            {
               _loc7_ = _loc2_ - _data.buyCount;
               _loc4_ = uint(_loc7_ > 0?458496:16723968);
               this.txt_count.text = LocaleMgr.ins.getStr(999000303) + TextFieldUtil.htmlText2(_loc7_ + "/" + _loc2_,_loc4_);
            }
            else
            {
               this.txt_count.text = "";
            }
            if(_loc7_ == 0)
            {
               txt_status.text = LocaleMgr.ins.getStr(999000305);
               img_statusBg.visible = true;
               img_statusBg.skin = SkinLib.changeSkinNum(img_statusBg.skin,2);
            }
            else
            {
               _loc3_ = _data.disCount;
               if(!_loc3_ && !_data.isHotSale && !_data.isNew)
               {
                  _loc3_ = _data.stcMallItemVo.discount;
               }
               if(_data.isNew)
               {
                  txt_status.text = LocaleMgr.ins.getStr(999000306);
                  img_statusBg.visible = true;
                  img_statusBg.skin = SkinLib.changeSkinNum(img_statusBg.skin,1);
               }
               if(_data.isHotSale)
               {
                  txt_status.text = LocaleMgr.ins.getStr(999000307);
                  img_statusBg.visible = true;
                  img_statusBg.skin = SkinLib.changeSkinNum(img_statusBg.skin,3);
               }
               if(_loc3_ > 0 && _loc3_ < 1)
               {
                  _loc6_ = _loc3_ * 100;
                  if(_loc6_ % 10 == 0)
                  {
                     _loc6_ = _loc6_ / 10;
                  }
                  if(!ClientConfig.isChineseLang())
                  {
                     _loc6_ = 100 - _loc3_ * 100;
                  }
                  txt_status.text = _loc6_ + LocaleMgr.ins.getStr(999000308);
                  img_statusBg.visible = true;
                  img_statusBg.skin = SkinLib.changeSkinNum(img_statusBg.skin,1);
               }
            }
            if(!img_statusBg.visible)
            {
               txt_name.x = width - txt_name.width >> 1;
            }
            else
            {
               txt_name.x = raw_X;
            }
         }
      }
      
      private function doBuy() : void
      {
         if(_data.canBuyCount > 0)
         {
            doBuyItem();
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000304));
         }
      }
      
      private function doBuyItem() : void
      {
         ModuleMgr.ins.showModule(11201,_data,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}

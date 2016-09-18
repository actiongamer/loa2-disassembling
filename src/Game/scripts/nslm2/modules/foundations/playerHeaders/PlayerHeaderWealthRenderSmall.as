package nslm2.modules.foundations.playerHeaders
{
   import game.ui.playerHeaders.PlayerHeaderWealthRenderSmallUI;
   import nslm2.common.vo.PlayerDiamondVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class PlayerHeaderWealthRenderSmall extends PlayerHeaderWealthRenderSmallUI
   {
       
      
      public function PlayerHeaderWealthRenderSmall()
      {
         super();
      }
      
      override protected function validateTooltip() : void
      {
         var _loc1_:* = null;
         if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
         {
            if(wealthVo.kind == 3)
            {
               _loc1_ = new PlayerDiamondVo();
               _loc1_.showGlodDiamond = false;
               this.toolTip = _loc1_;
            }
            else if(wealthVo.kind == 4)
            {
               _loc1_ = new PlayerDiamondVo();
               _loc1_.showNormalDiamond = false;
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
      
      override protected function validateTxtNum() : void
      {
         var _loc1_:int = 0;
         if(wealthVo)
         {
            if(wealthVo.kind == 3)
            {
               _loc1_ = PlayerModel.ins.getWealthValue(3);
            }
            else
            {
               var _loc2_:int = 4;
               wealthVo.kind = _loc2_;
               if(_loc2_)
               {
                  _loc1_ = PlayerModel.ins.getWealthValue(4);
               }
            }
            this.txt_num.text = LocaleConsts.getNumberAbbr2(_loc1_.toString(),100000);
         }
      }
   }
}

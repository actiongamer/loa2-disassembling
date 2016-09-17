package nslm2.modules.funnies.tencent.render
{
   import game.ui.TencentModule.render.TencentVipLvlUpGiftRenderUI;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   
   public class TencentVipLvlUpGiftRender extends TencentVipLvlUpGiftRenderUI
   {
       
      
      public function TencentVipLvlUpGiftRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = this.listCellVo.dataIndex + 1;
         var _loc3_:int = _loc2_ * 10;
         this.clip_lvl.value = _loc3_;
         this.list_gift.array = WealthUtil.costStrToArr(DefindConsts.getQQVIP_LVUP(_loc3_));
         if(_loc3_ <= PlayerModel.ins.level)
         {
            if(TencentVipModel.ins.canGetLvup(_loc2_))
            {
               this.list_gift.disabled = false;
            }
            else
            {
               this.list_gift.disabled = true;
            }
         }
         else
         {
            this.list_gift.disabled = true;
         }
      }
   }
}

package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.runeBag.RuneComposeRenderUI;
   import morn.core.handlers.Handler;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   
   public class RuneComeposeRender extends RuneComposeRenderUI
   {
       
      
      public function RuneComeposeRender()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         additionList.renderHandler = new Handler(additionListHandler);
      }
      
      private function additionListHandler(param1:Box, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && param2 < additionList.array.length)
         {
            _loc3_ = param1.getChildByName("itemTxt") as Label;
            _loc4_ = additionList.array[param2] as NpcPropVo;
            if(_loc3_ && _loc4_)
            {
               _loc3_.text = "（" + NPCPropConsts.ins.getLocaleNameNormal(_loc4_.propId) + " " + NPCPropConsts.ins.showValue(_loc4_.value,"+") + "）";
            }
         }
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0 && wealthVo.kind != 999999)
         {
            this.img_icon.toolTip = WealthUtil.tooltip(wealthVo);
         }
         else
         {
            this.img_icon = null;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc3_:Array = NpcPropVo.parseStr1((param1 as WealthVo).stcItemVo.extend_3);
         var _loc2_:int = wealthVo.showCount;
         var _loc4_:Number = PlayerModel.ins.getCountByWealthVo(wealthVo);
         additionList.repeatY = _loc3_.length;
         if(additionList.repeatY == 2)
         {
            var _loc5_:int = 28;
            itemBox.y = _loc5_;
            §§push(_loc5_);
         }
         else
         {
            _loc5_ = 8;
            itemBox.y = _loc5_;
            §§push(Number(_loc5_));
         }
         §§pop();
         additionList.array = _loc3_;
         txt_have.text = _loc4_ + "";
         txt_need.text = _loc2_ + "";
         if(_loc2_ <= _loc4_)
         {
            txt_have.color = 458496;
         }
         else
         {
            txt_have.color = 16723968;
         }
      }
   }
}

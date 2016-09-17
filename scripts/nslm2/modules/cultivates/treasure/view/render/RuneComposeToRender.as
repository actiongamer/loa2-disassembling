package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.runeBag.RuneComposeRenderToUI;
   import morn.core.handlers.Handler;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class RuneComposeToRender extends RuneComposeRenderToUI
   {
       
      
      public function RuneComposeToRender()
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
         var _loc2_:Array = NpcPropVo.parseStr1((param1 as WealthVo).stcItemVo.extend_3);
         var _loc3_:Number = PlayerModel.ins.getCountByWealthVo(wealthVo);
         additionList.repeatY = _loc2_.length;
         if(additionList.repeatY == 2)
         {
            var _loc4_:int = 38;
            itemBox.y = _loc4_;
            §§push(_loc4_);
         }
         else
         {
            _loc4_ = 18;
            itemBox.y = _loc4_;
            §§push(Number(_loc4_));
         }
         §§pop();
         additionList.array = _loc2_;
         txt_getCnt.text = LocaleMgr.ins.getStr(30600204) + TextFieldUtil.htmlText2(wealthVo.showCount,458496);
      }
   }
}

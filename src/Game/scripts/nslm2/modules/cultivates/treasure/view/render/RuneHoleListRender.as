package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RuneHoleListRenderUI;
   import nslm2.modules.cultivates.treasure.vo.TreasureRuneHoleVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.TextFieldUtil;
   
   public class RuneHoleListRender extends RuneHoleListRenderUI
   {
       
      
      private var _data:TreasureRuneHoleVo;
      
      public function RuneHoleListRender()
      {
         super();
         this.img_icon.mask = img_mask;
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(_data)
         {
            return _data.runeVo;
         }
         return null;
      }
      
      override protected function validateTooltip() : void
      {
         super.validateTooltip();
         if(_data)
         {
            if(_data.status == 0)
            {
               this.toolTip = LocaleMgr.ins.getStr(30600014);
            }
            if(_data.status == 1)
            {
               this.toolTip = LocaleMgr.ins.getStr(30600013);
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _data = param1 as TreasureRuneHoleVo;
         img_lock.disabled = false;
         img_lock.mouseEnabled = false;
         if(_data)
         {
            switch(int(_data.status))
            {
               case 0:
                  img_lock.visible = true;
                  img_lock.disabled = true;
                  break;
               case 1:
                  img_lock.visible = true;
                  this.mouseChildren = true;
                  this.mouseEnabled = true;
                  break;
               case 2:
                  img_lock.visible = false;
                  this.mouseChildren = true;
                  this.mouseEnabled = true;
            }
            if(wealthVo && wealthVo.stcItemVo)
            {
               _loc5_ = "";
               _loc4_ = wealthVo.stcItemVo.extend_3.split("|");
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length)
               {
                  _loc2_ = NpcPropVo.parseStr(String(_loc4_[_loc6_]),"+");
                  _loc3_ = NPCPropConsts.ins.showValue(_loc2_.value,_loc2_.preFix);
                  if(_loc2_.isShowColor)
                  {
                     _loc3_ = TextFieldUtil.htmlText2(_loc3_,_loc2_.getValueColor());
                  }
                  _loc5_ = _loc5_ + NPCPropConsts.ins.getLocaleNameNormal(_loc2_.propId) + " " + _loc3_ + " ";
                  _loc6_++;
               }
               txt_addtion.text = _loc5_;
            }
            else
            {
               txt_addtion.text = "";
            }
         }
         .super.dataSource = param1;
      }
   }
}

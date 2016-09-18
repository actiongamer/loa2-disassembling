package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.comp.TreasureRemouldPropRenderUI;
   import game.ui.roleInfos.NpcPropVo;
   import proto.BaoWuBuff;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import morn.core.components.Component;
   import morn.core.components.Clip;
   
   public class TreasureRemouldPropRender extends TreasureRemouldPropRenderUI
   {
       
      
      private var _currentId:int = 0;
      
      public function TreasureRemouldPropRender()
      {
         super();
      }
      
      public function get currentId() : int
      {
         return _currentId;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(param1)
         {
            if(param1 is NpcPropVo)
            {
               .super.dataSource = param1;
               _currentId = (param1 as NpcPropVo).propId;
            }
            else if(param1 is BaoWuBuff)
            {
               _loc3_ = param1 as BaoWuBuff;
               this.txt_name.text = LocaleMgr.ins.getStr(2000000000 + _loc3_.id);
               _currentId = _loc3_.id;
               _loc2_ = _loc3_.value;
               if(StcMgr.ins.getVoByColumnValue("static_baowu_attr","attr",_loc3_.id).fix != 1)
               {
                  if(NumberUtil.isFloatNumber(_loc2_))
                  {
                     _loc2_ = _loc2_ * 100;
                  }
                  if(NumberUtil.isFloatNumber(_loc2_))
                  {
                     this.txt_value.text = "+" + _loc2_.toFixed(1) + "%";
                  }
                  else
                  {
                     this.txt_value.text = "+" + _loc2_ + "%";
                  }
               }
               else
               {
                  this.txt_value.text = "+" + _loc2_;
               }
            }
            if(_currentId == TreasureModel.ins.selectedTreasure.remould)
            {
               this.txt_name.style = "加底标题";
               this.txt_value.style = "加底标题";
            }
            else
            {
               this.txt_name.style = "普通说明";
               this.txt_value.style = "普通说明";
               this.txt_name.bold = false;
               this.txt_value.bold = false;
            }
         }
         else
         {
            this.txt_value.text = "?";
            this.txt_name.text = "";
         }
         this.toolTip = null;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         var _loc6_:Component = this.getChildByName("selectBox") as Component;
         if(_loc6_)
         {
            _loc6_.visible = param1 != 1;
            if(_loc6_ is Clip)
            {
               (_loc6_ as Clip).frame = param1;
            }
         }
         var _loc2_:Component = this.getChildByName("selectBoxAll") as Component;
         if(_loc2_)
         {
            _loc2_.visible = param1 == 2 || param1 == 3;
         }
         var _loc3_:Component = this.getChildByName("selectBox" + 0) as Component;
         if(_loc3_)
         {
            _loc3_.visible = param1 == 2;
         }
         var _loc4_:Component = this.getChildByName("selectBox" + 1) as Component;
         if(_loc4_)
         {
            _loc4_.visible = param1 != 3;
         }
         var _loc5_:Component = this.getChildByName("selectBox" + 2) as Component;
         if(_loc5_)
         {
            _loc5_.visible = param1 == 3;
         }
      }
   }
}

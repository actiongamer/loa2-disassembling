package morn.core.components
{
   import morn.editor.core.IBox;
   import flash.display.DisplayObject;
   import morn.customs.expands.ListCellVo;
   
   public class Box extends Component implements IBox
   {
       
      
      private var _listCellVo:ListCellVo;
      
      public function Box()
      {
         super();
      }
      
      override protected function preinitialize() : void
      {
         mouseChildren = true;
      }
      
      public function removeAllChild(param1:DisplayObject = null) : void
      {
         var _loc2_:int = 0;
         _loc2_ = numChildren - 1;
         while(_loc2_ > -1)
         {
            if(param1 != getChildAt(_loc2_))
            {
               removeChildAt(_loc2_);
            }
            _loc2_--;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         _dataSource = param1;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            _loc2_ = getChildByName(_loc3_) as Component;
            if(_loc2_)
            {
               _loc2_.dataSource = param1[_loc3_];
            }
            else if(hasOwnProperty(_loc3_))
            {
               this[_loc3_] = param1[_loc3_];
            }
         }
      }
      
      public function get listCellVo() : ListCellVo
      {
         return _listCellVo;
      }
      
      public function set listCellVo(param1:ListCellVo) : void
      {
         _listCellVo = param1;
      }
      
      public function changeSelectState(param1:int) : void
      {
         var _loc5_:Clip = this.getChildByName("selectBox") as Clip;
         if(_loc5_)
         {
            _loc5_.visible = param1 != 1;
            _loc5_.frame = param1;
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
            _loc4_.visible = param1 == 3;
         }
      }
   }
}

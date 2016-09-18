package nslm2.common.ui.components.debug3d
{
   import game.ui.logModules.Object3DParamsUI;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.mediators.DragMediator;
   import com.mz.core.mgrs.UIMgr;
   import away3d.core.base.Object3D;
   import flash.geom.Vector3D;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import flash.events.MouseEvent;
   import nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
   
   public class Object3DParams extends Object3DParamsUI
   {
       
      
      private var dragMe:DragMediator;
      
      protected var o3d:Object3D;
      
      private var oldValue:Vector3D;
      
      public function Object3DParams(param1:String = "", param2:Object3D = null)
      {
         super();
         this.txt_name.text = param1;
         this.btn_refresh.clickHandler = btn_handler;
         if(param2)
         {
            o3d = param2;
            this.refresh();
         }
      }
      
      private function btn_handler() : void
      {
         this.refresh();
      }
      
      override protected function initialize() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         super.initialize();
         this.list_params.dataSource = ArrayUtil.fillBySameItem([],9,0);
         this.list_params.addEventListener("PARAM_VALUE_CHANGE",list_onChange);
         var _loc2_:int = this.list_params.length;
         var _loc1_:Array = ["x","y","z"];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.list_params.getCell(_loc4_) as Param3DRender;
            _loc3_.txt_name.text = String(_loc1_[_loc4_ % 3]).toUpperCase();
            switch(int(_loc4_))
            {
               case 0:
               case 1:
               case 2:
                  _loc3_.paramType = "position";
                  break;
               case 3:
               case 4:
               case 5:
                  _loc3_.paramType = "rotation";
                  break;
               case 6:
               case 7:
               case 8:
                  _loc3_.paramType = "scale";
            }
            _loc4_++;
         }
         this.btn_scale.mouseEvent = true;
         dragMe = new DragMediator(this.btn_scale,UIMgr.stage);
         dragMe.addEventListener("start",dragMe_onStart);
         dragMe.addEventListener("update",dragMe_onChange);
      }
      
      public function bind(param1:Object3D) : void
      {
         o3d = param1;
         this.refresh();
      }
      
      private function dragMe_onStart(param1:Event) : void
      {
         oldValue = new Vector3D(o3d.scaleX,o3d.scaleY,o3d.scaleZ);
      }
      
      private function dragMe_onChange(param1:MzEvent) : void
      {
         var _loc2_:Number = (dragMe.thisMouseX - dragMe.oriMouseX) * 0.01;
         var _loc3_:MouseEvent = param1.data as MouseEvent;
         if(_loc3_.ctrlKey)
         {
            _loc2_ = _loc2_ * 4;
         }
         else if(_loc3_.altKey)
         {
            _loc2_ = _loc2_ * 2;
         }
         o3d.scaleX = oldValue.x * (1 + _loc2_);
         o3d.scaleY = oldValue.y * (1 + _loc2_);
         o3d.scaleZ = oldValue.z * (1 + _loc2_);
         this.refresh();
      }
      
      public function refresh() : void
      {
         this.list_params.dataSource = [o3d.position.x,o3d.position.y,o3d.position.z,o3d.rotationX,o3d.rotationY,o3d.rotationZ,o3d.scaleX,o3d.scaleY,o3d.scaleZ];
      }
      
      public function getValueAt(param1:int) : Number
      {
         return (this.list_params.getCell(param1) as Param3DRender).value;
      }
      
      public function setValueAt(param1:int, param2:Number) : void
      {
         (this.list_params.getCell(param1) as Param3DRender).value = param2;
      }
      
      public function get transfrom3DVo() : BgTransfrom3DVo
      {
         var _loc1_:BgTransfrom3DVo = new BgTransfrom3DVo();
         _loc1_.x = getValueAt(0);
         _loc1_.y = getValueAt(1);
         _loc1_.z = getValueAt(2);
         _loc1_.rotationX = getValueAt(3);
         _loc1_.rotationY = getValueAt(4);
         _loc1_.rotationZ = getValueAt(5);
         _loc1_.scaleX = getValueAt(6);
         _loc1_.scaleY = getValueAt(7);
         _loc1_.scaleZ = getValueAt(8);
         return _loc1_;
      }
      
      private function list_onChange(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc3_:Number = NaN;
         var _loc2_:Param3DRender = param1.target as Param3DRender;
         if(_loc2_ && o3d)
         {
            _loc4_ = o3d.position;
            _loc3_ = _loc2_.txt_value.text;
            var _loc5_:* = _loc2_.listCellVo.listIndex + 1;
            if(1 !== _loc5_)
            {
               if(2 !== _loc5_)
               {
                  if(3 !== _loc5_)
                  {
                     if(4 !== _loc5_)
                     {
                        if(5 !== _loc5_)
                        {
                           if(6 !== _loc5_)
                           {
                              if(7 !== _loc5_)
                              {
                                 if(8 !== _loc5_)
                                 {
                                    if(9 === _loc5_)
                                    {
                                       this.o3d.scaleZ = _loc3_;
                                    }
                                 }
                                 else
                                 {
                                    this.o3d.scaleY = _loc3_;
                                 }
                              }
                              else
                              {
                                 this.o3d.scaleX = _loc3_;
                              }
                           }
                           else
                           {
                              this.o3d.rotationZ = _loc3_;
                           }
                        }
                        else
                        {
                           this.o3d.rotationY = _loc3_;
                        }
                     }
                     else
                     {
                        this.o3d.rotationX = _loc3_;
                     }
                  }
                  else
                  {
                     this.o3d.z = _loc3_;
                  }
               }
               else
               {
                  _loc4_.y = _loc3_;
                  this.o3d.position = _loc4_;
               }
            }
            else
            {
               _loc4_.x = _loc3_;
               this.o3d.position = _loc4_;
            }
         }
      }
   }
}

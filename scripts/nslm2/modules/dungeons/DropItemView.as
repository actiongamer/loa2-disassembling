package nslm2.modules.dungeons
{
   import flash.events.EventDispatcher;
   import flash.display.DisplayObjectContainer;
   import away3d.events.MouseEvent3D;
   import flash.ui.Mouse;
   import nslm2.modules.scenes.commons.Unit3DTagBottomBox;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import proto.Reward;
   import nslm2.common.vo.WealthVo;
   import game.ui.commons.icons.WealthRenderS3UI;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import flash.display.DisplayObject;
   import morn.core.components.Component;
   import nslm2.utils.Uint64Util;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenLite;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.handlers.Handler;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import flash.events.Event;
   
   class DropItemView extends EventDispatcher
   {
      
      public static const MOVE_TO_END:String = "moveToEnd";
       
      
      private var dropRotation:int;
      
      private var url:String;
      
      private var parent2D:DisplayObjectContainer;
      
      private var aimTarget;
      
      private var _dropArr:Array;
      
      public var tag3DBottomBox:Unit3DTagBottomBox;
      
      private var _xy:Point;
      
      private var moveRo:Number;
      
      private var moveSpeed:Number;
      
      function DropItemView(param1:Array, param2:int, param3:int, param4:ObjectContainer3D, param5:DisplayObjectContainer, param6:DisplayObject)
      {
         tag3DBottomBox = new Unit3DTagBottomBox();
         super();
         _dropArr = param1;
         parent2D = param5;
         aimTarget = param6;
         var _loc7_:StcModelVo = StcMgr.ins.getModelVo(30001);
         xy = new Point(param2,param3);
         dropRotation = MathUtil.random(225,135);
         tag3DBottomBox.showShadow();
         moveToEnd();
         this.dispatchEvent(new Event("moveToEnd"));
      }
      
      protected function onMouseOut(param1:MouseEvent3D) : void
      {
         Mouse.cursor = "auto";
      }
      
      protected function onMouseOver(param1:MouseEvent3D) : void
      {
         Mouse.cursor = "hand";
      }
      
      public function get dropArr() : Array
      {
         return _dropArr;
      }
      
      public function get xy() : Point
      {
         return _xy;
      }
      
      public function set xy(param1:Point) : void
      {
         _xy = param1;
      }
      
      private function moveToDrop() : void
      {
         this.xy = MathUtil.nextPoint(this.xy,this.dropRotation,1);
      }
      
      public function moveToEnd(... rest) : void
      {
         args = rest;
         App.timer.clearTimer(this.moveToDrop);
         var _loc5_:int = 0;
         var _loc4_:* = _dropArr;
         for each(item in _dropArr)
         {
            flyCpl = function(param1:Component):void
            {
               param1.dispose();
               if($stcItemVo)
               {
                  var _loc2_:* = $stcItemVo.kind;
                  if(21 !== _loc2_)
                  {
                     if(51 !== _loc2_)
                     {
                        aimTarget.itemCount = aimTarget.itemCount + Uint64Util.toInt(item.count);
                        new FloatZoomInEffCtrl(aimTarget.icon_item);
                     }
                     else
                     {
                        aimTarget.equipPieceCount = aimTarget.equipPieceCount + Uint64Util.toInt(item.count);
                        new FloatZoomInEffCtrl(aimTarget.icon_equip_piece);
                     }
                  }
                  else
                  {
                     aimTarget.heroPieceCount = aimTarget.heroPieceCount + Uint64Util.toInt(item.count);
                     new FloatZoomInEffCtrl(aimTarget.icon_hero_piece);
                  }
               }
               else
               {
                  aimTarget.itemCount = aimTarget.itemCount + Uint64Util.toInt(item.count);
               }
            };
            var wvo:WealthVo = WealthUtil.rewardToVo(item);
            var render:WealthRenderS3UI = new WealthRenderS3UI();
            render.dataSource = wvo;
            var $stcItemVo:StcItemVo = StcMgr.ins.getItemVo(item.dropId);
            if($stcItemVo)
            {
               var _loc3_:* = $stcItemVo.kind;
               if(21 !== _loc3_)
               {
                  if(51 !== _loc3_)
                  {
                     var tarObj:DisplayObject = this.aimTarget.icon_item;
                  }
                  else
                  {
                     tarObj = this.aimTarget.icon_equip_piece;
                  }
               }
               else
               {
                  tarObj = this.aimTarget.icon_hero_piece;
               }
            }
            else
            {
               tarObj = this.aimTarget.icon_item;
            }
            render.x = xy.x - render.width;
            render.y = xy.y - render.height;
            ModuleMgr.ins.topEffectLayer.addChild(render);
            TweenLite.to(render,0.5,{"x":render.x - 50});
            new IconFlyEff(render,render,tarObj).set_delayExec(1500).addHandlers(new Handler(flyCpl,[render])).exec();
         }
      }
      
      private function moveToEnd_loop() : void
      {
         this.xy = MathUtil.nextPoint(this.xy,this.moveRo,moveSpeed);
      }
      
      private function moveToEnd_cpl() : void
      {
         Mouse.cursor = "auto";
         if(tag3DBottomBox)
         {
            tag3DBottomBox.dispose();
            tag3DBottomBox = null;
         }
      }
   }
}

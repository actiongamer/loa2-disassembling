package nslm2.common.ui.components.comps2d
{
   import morn.core.components.Component;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.interFace.IUniqueId;
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.Stc2dSpecialEffectVo;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import com.mz.core.utils2.task.TaskPool;
   import com.spriteSheet.SpriteSheet;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.spriteSheet.SpriteSheetData;
   import morn.core.utils.StringUtils;
   import com.mz.core.logging.Log;
   import morn.core.handlers.Handler;
   import morn.core.utils.UniqueId;
   
   public class BmcSpriteSheet extends Component implements IDispose, IUniqueId
   {
      
      public static const ALL:String = "all";
       
      
      private var _sheets;
      
      private var _sid:int;
      
      private var _frame:int;
      
      private var _actionName:String;
      
      private var _isAlwaysLoop:Boolean;
      
      private var _startFrame:int;
      
      private var _endFrame:int;
      
      private var _endHandler;
      
      private var _autoDispose:Boolean;
      
      private var _frameRate:int;
      
      private var _sp:SpriteSheet;
      
      private var _vo:Stc2dSpecialEffectVo;
      
      private var _anchorX:Number;
      
      private var _anchorY:Number;
      
      public var _uniqueId:uint;
      
      private var _needLoopCnt:int;
      
      public function BmcSpriteSheet()
      {
         super();
         this._uniqueId = UniqueId.next;
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public static function getPreloadTaskArr(param1:Vector.<int>) : Vector.<TaskBase>
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:Vector.<TaskBase> = new Vector.<TaskBase>();
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc5_ in param1)
         {
            _loc3_ = StcMgr.ins.get2dSpecialEffectVo(_loc5_);
            _loc2_ = _loc3_.path;
            _loc4_.push(new GetResTask(34,_loc2_ + ".ssd"));
         }
         return _loc4_;
      }
      
      public static function preload(param1:Vector.<int>, param2:* = null) : void
      {
         var _loc3_:TaskPool = new TaskPool();
         _loc3_.addTaskArr(getPreloadTaskArr(param1));
         if(param2)
         {
            _loc3_.addCompleteHandler(param2);
         }
         _loc3_.stopWhenError = false;
         _loc3_.exec();
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      public function setframeRate(param1:int) : BmcSpriteSheet
      {
         _frameRate = param1;
         return this;
      }
      
      public function setNeedLoopCnt(param1:int) : BmcSpriteSheet
      {
         _needLoopCnt = param1;
         return this;
      }
      
      public function setAnchor(param1:Number = 0, param2:Number = 0) : BmcSpriteSheet
      {
         _anchorX = param1;
         _anchorY = param2;
         return this;
      }
      
      public function set_endHandler(param1:*) : BmcSpriteSheet
      {
         this._endHandler = param1;
         return this;
      }
      
      public function get sid() : int
      {
         return _sid;
      }
      
      public function init(param1:int, param2:int = 1, param3:String = "all", param4:Boolean = false, param5:int = 1, param6:int = 0, param7:* = null, param8:Boolean = true) : void
      {
         _sid = param1;
         _frame = param2;
         _actionName = param3;
         _isAlwaysLoop = param4;
         _startFrame = param5;
         _endFrame = param6;
         _autoDispose = param8;
         _vo = StcMgr.ins.get2dSpecialEffectVo(param1);
         if(_frameRate == 0)
         {
            _frameRate = _vo.frame_rate;
         }
         if(_endHandler == null)
         {
            _endHandler = param7;
         }
         new GetResTask(34,_vo.path + ".ssd",2).addHandlers(getPng_cpl).exec();
      }
      
      public function addEndHandler(param1:*) : BmcSpriteSheet
      {
         _endHandler = param1;
         return this;
      }
      
      private function getPng_cpl(param1:GetResTask) : void
      {
         var _loc2_:* = null;
         if(this.isDisposed)
         {
            return;
         }
         try
         {
            _loc2_ = ResMgr.ins.getRes(param1.url) as SpriteSheetData;
            if(_loc2_)
            {
               _sp = new SpriteSheet(_vo.path,_loc2_);
               _sp.setAction(_actionName,_frameRate,_isAlwaysLoop,_needLoopCnt);
               _sp.x = -_sp.oriWidth * _anchorX;
               _sp.y = -_sp.oriHeight * _anchorY;
               if(StringUtils.isNull(_vo.blendmode) == false)
               {
                  _sp.blendMode = _vo.blendmode;
               }
               _sp.gotoAndPlay(_frame,_startFrame,_endFrame,_endHandler,_autoDispose);
               this.addChild(_sp);
            }
            else
            {
               this.dispose();
            }
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      public function gotoAndStop(param1:int) : void
      {
         if(_sp)
         {
            _sp.gotoAndStop(param1);
         }
      }
      
      public function gotoAndPlay(param1:uint, param2:int = 1, param3:int = 0, param4:Handler = null, param5:Boolean = true) : void
      {
         if(_sp)
         {
            _sp.gotoAndPlay(param1,param2,param3,param4,param5);
         }
      }
      
      public function stop() : void
      {
         if(_sp)
         {
            _sp.stop();
         }
      }
      
      public function play() : void
      {
         if(_sp)
         {
            _sp.play();
         }
      }
      
      public function set autoDispose(param1:Boolean) : void
      {
         _autoDispose = param1;
      }
      
      override public function dispose() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.stop();
         if(_sp)
         {
            _sp.dispose();
            _sp = null;
         }
         _sheets = null;
         super.dispose();
      }
      
      public function get isPlaying() : Boolean
      {
         if(_sp)
         {
            return _sp.isPlaying;
         }
         return false;
      }
      
      public function set scaleAll(param1:Number) : void
      {
         this.scaleX = param1;
         this.scaleY = param1;
         this.scaleZ = param1;
      }
      
      public function setScaleXY(param1:Number, param2:Number) : BmcSpriteSheet
      {
         this.scaleX = param1;
         this.scaleY = param2;
         return this;
      }
   }
}

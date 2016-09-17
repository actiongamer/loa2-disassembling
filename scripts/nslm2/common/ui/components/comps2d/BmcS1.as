package nslm2.common.ui.components.comps2d
{
   import com.mz.core.components.comp2d.bitmapClips.Bmc;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.mgrs.stcMgrs.vos.Stc2dSpecialEffectVo;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import com.mz.core.components.comp2d.bitmapClips.BmcData;
   
   public class BmcS1 extends Bmc
   {
       
      
      public var sid:int;
      
      private var _frame:int = 1;
      
      private var _isLoop:Boolean = true;
      
      private var _startFrame:int = 1;
      
      private var _endFrame:int = 0;
      
      private var _endfunc:Function = null;
      
      private var _endFuncParamArr:Array = null;
      
      private var _autoDispose:Boolean;
      
      public function BmcS1()
      {
         super();
      }
      
      public static function preload(param1:int) : void
      {
         var _loc2_:String = StcMgr.ins.get2dSpecialEffectVo(param1).path;
         new GetResTask(15,_loc2_).exec();
      }
      
      public function init(param1:int, param2:int = 1, param3:Boolean = true, param4:int = 1, param5:int = 0, param6:Function = null, param7:Array = null, param8:Boolean = true) : void
      {
         this.sid = param1;
         this._isLoop = param3;
         this._startFrame = param4;
         this._endFrame = param5;
         this._endfunc = param6;
         this._endFuncParamArr = param7;
         this._frame = param2;
         this._autoDispose = param8;
         var _loc9_:Stc2dSpecialEffectVo = StcMgr.ins.get2dSpecialEffectVo(sid);
         this.frameRate = _loc9_.frame_rate;
         new GetResTask(15,_loc9_.path).addHandlers(getEff2d_cpl).exec();
      }
      
      private function getEff2d_cpl(param1:GetResTask) : void
      {
         this.data = ResMgr.ins.getRes(param1.url) as BmcData;
         this.gotoAndPlay(_frame,_isLoop,_startFrame,_endFrame,_endfunc,_endFuncParamArr,_autoDispose);
      }
   }
}

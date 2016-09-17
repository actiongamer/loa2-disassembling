package nslm2.common.model
{
   import com.mz.core.utils2.task.TaskBase;
   import com.netease.protobuf.UInt64;
   import nslm2.nets.sockets.ServerEngine;
   import proto.HeroInfoReq;
   import proto.HeroInfoNotify;
   
   public class GetHeroInfoTask extends TaskBase
   {
       
      
      public var heroId:UInt64;
      
      public function GetHeroInfoTask(param1:UInt64)
      {
         super();
         this.heroId = param1;
      }
      
      override public function exec() : void
      {
         super.exec();
         ServerEngine.ins.addAlwayHandler(5011,heroInfoNotifyHander);
         var _loc1_:HeroInfoReq = new HeroInfoReq();
         _loc1_.id = heroId;
         ServerEngine.ins.send(5005,_loc1_);
      }
      
      private function heroInfoNotifyHander(param1:HeroInfoNotify) : void
      {
         ServerEngine.ins.removeAlwayHandler(5011,heroInfoNotifyHander);
         HeroModel.ins.onChangeOne(param1.info);
         this.onComplete();
      }
   }
}

package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.FieldDescriptor;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   
   public final class FieldDescriptor$TYPE_MESSAGE extends FieldDescriptor
   {
       
      
      public var messageType:Class;
      
      public function FieldDescriptor$TYPE_MESSAGE(param1:String, param2:String, param3:uint, param4:Class)
      {
         super();
         this.fullName = param1;
         this.name = param2;
         this.tag = param3;
         this.messageType = param4;
      }
      
      override public function get type() : Class
      {
         return this.messageType;
      }
      
      override public function readSingleField(param1:IDataInput) : *
      {
         return ReadUtils.read$TYPE_MESSAGE(param1,new this.messageType());
      }
      
      override public function writeSingleField(param1:WritingBuffer, param2:*) : void
      {
         WriteUtils.write$TYPE_MESSAGE(param1,param2);
      }
   }
}

from aiogram import types, F, Router
from aiogram.types import Message
from aiogram.filters import Command

router = Router()


@router.message(Command('Start'))
async def start_handler(msg: Message):
    await msg.answer('Отправьте любое сообщение, чтобы узнать свой ID')


@router.message()
async def message_handler(msg: Message):
    await msg.answer(f'ID: {msg.from_user.id}')
import express from "express";
import { PostsBusiness } from "../business/PostsBusiness";
import { PostController } from "../controller/PostController";
import { PostDatabase } from "../database/PostsDatabase";

export const postsRouter = express.Router()

const postController = new PostController(
    new PostsBusiness(
        new PostDatabase(),
    )
       )
postsRouter.get("/", postController.getPosts)
postsRouter.post("/", postController.createPost)
postsRouter.put("/:id", postController.editPost)
postsRouter.delete("/:id", postController.deletePost)
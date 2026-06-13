Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610802459DC
	for <io-uring@vger.kernel.org>; Sat, 13 Jun 2026 02:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317636; cv=pass; b=HbS9oGSxt6d+NDgW2uE7rx4Di/VGBoNMQINhy2ketoyBRDuuVhufdqlwdD5S0HteddsHr/FW3L/boEfCTUTnwUI4N0+rQFU97Z01HeNo3pnkyHxfmn93hrCpnFdeOQDWXwBcA3yUif4z0ey8aiJDg/jqeAhDhrlySylqUDUBQys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317636; c=relaxed/simple;
	bh=bX/vOuzTdUT+DujDxSoAS4OMe6xvOd+WMjq1HYKfm/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj13k03cEABWBuKxqfKlwkKCj48tv0qf3E3k3tSRSRcmUyHr/GAKhdcLKhOlk+AqLnBAK0jWee1IKukxQT76qnphRXbBgOC0xl/HfYQ+S9579QPErVJ1/zsltytRWJ7T9uubwlAbOyoJvWr1f9Qxc424NaOdZHUbZzCLdYSpgCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NGVucbg4; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NGVucbg4"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6f4728b8dso245490a34.3
        for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 19:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781317634; cv=none;
        d=google.com; s=arc-20240605;
        b=Xvm0LldvwgQAie6r4BurHqaj3ywEz6GQ3j8SBohv6jjZ9Sxw/9Q/GPniIzYMgMmqkZ
         l+63X6Xjz8CXlPwkJsx8+yxqruP5ZaHQ4y4GMVxTOekcL34f9oeWXKbDOxNi3uBzQY1a
         aX9mZ4psWxgqEYfadlyTgHk1hcFCiTV3hjyv6Fw6q55Rb93tWoQxybn6x+Q86zkpyk2f
         cOlAwIyw5u0k1K6p/slhoTyjYEyoWcy2bXULchGMRYKlBnwWzvDIu3O4DDANOVKUeQLy
         IBC8zpJw6BccXQlMaaIUO+zKTvj/aYFBzeL7dof7q10gotuGYbksmgEbg5j3paq3lV3W
         tIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s2HwKy3hnlNYS81SZUJ/mWc9fdLiA8l0XHu89pAw9sk=;
        fh=tcB1jbK5Mfh49jFaBDMFCl5E4RG50sbZDH32oaESUuc=;
        b=Icx5klREf0JGWdmMFfxa99/4C7qcEisTKsW3mt39/bYz6co9KrM3syXsZmQ3x9XEDq
         lz7vq36z3dpplaQkfHH2fkQ0hEY+mWCZOg5XBdAlXOJ3B63D0vtSfdLotKXI+AZeKZ7W
         i8p5JiUQg1dwqg0V/9J2++iVcH0VL7GhtC9KmD1PCrmpL1XBaAfLJxv5NbtWLrkjSYmv
         2cTBPg6/wvA+jvykRjems9+Em/xAOYB4pcOGXtPz5Lm255S47kWJOdMirVELEfzfjOJe
         ANZ/P1gW2b/weUHqiMYE3b5F0sbVhM/77bXiYePVAxbEkTY1YuyDmTNZ5ap2XLjn8sB+
         U4Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1781317634; x=1781922434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2HwKy3hnlNYS81SZUJ/mWc9fdLiA8l0XHu89pAw9sk=;
        b=NGVucbg4EB4mek7626VR/SfsMbMfvCBK3XS2Fe/iZgP5myGH6A2PzV0xt38U5a6MH1
         YJ9nxzVw2I34yQJy6T8O8Tp8pyOflLNWVQ/W8ozka3rjgYPN89WYAgNApG8O8gm2Q865
         2kx25zfuPI0BgWhb76VblhsvL/gA17SkHQbilIVoKp/UXu6mLiXcWNY9ErPsfqS7r/Wv
         WQTlOeQBpfrdqj0OUD4Evg8gxLyc3Mdt1NcKQQtXF4bflyAp8/k+EUpvfZcpuiehJoSk
         1pN4uJoRefgSGxGpbM5kRV9lFs0ENtknhQ7mg41qCdmXQje76FgJaSXvmovw8BtXrqWL
         xYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317634; x=1781922434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s2HwKy3hnlNYS81SZUJ/mWc9fdLiA8l0XHu89pAw9sk=;
        b=VOHKyyAd07x0wS/jtFIQsU34IrcMer70VZSZdssZ07F31W6UZ+VANVpIY6HZMSbkJb
         tJdVbnFPMIQy10382XojkrzTSUQnItLhxQZ58NFbLKzAfwMKyolRxp0ou6LlNAOD5bt9
         IJI4bksKs9TmHiF0HC63hrrrqB2jS/Js1wzWi91qLtGN+XRKQvXw7yj3UHSDnom3VESk
         OpxP6ARUMCwRF6oVvgypnhuZmkx7/ohWwuBcy3BotudQedD0bnO8fBmM07OywvHVU3HS
         9ehTO5tLje0rwg80zmCFzUg/Nu23TmTgDPmI10+5kJ+yQxJ9oOkqmCXbw/t20oxVOuWV
         WblA==
X-Gm-Message-State: AOJu0YzrRI3Sg4KQ4QjzhTgAh+tuInN5hydd+RoAz5BIDxzbDRP4vwyS
	+LDaZAIxdmtK/uSm6MfVODIHqOHOO0cAZA0TNw6RP5531CijWXKWEMHC3L2wTJHVJi0wk0vl98m
	MZ/HPPKQezr6ZeD7jzCuTcuRX93dcgy0dFkGyAdbzFkosUoHetgkutznr6w==
X-Gm-Gg: Acq92OG9mVlAe+D6CuCDIrvU8caubvCQZcgvfgGWlEMklrMymqxA0IW1giWH24ZCegh
	grOZLYSGzng4NGKyQfAlNwkYQ1zUczRDIh14vA4LXpWT+zwxWGynAlRblzVzBJATeonJc1Nlbnf
	B1gZ9JA++8eWtNFtkAJXBstpzWNpB8bKJv6fnj4YWqXMk/SDk9z4xu0quzrDZcO/yVCF0nwmPSd
	W+7djddzHa/HKNX6klqLc4YBG7xufzNa6xdacM7G11f1vDAPCWQMgQsQFXqZSoWj0e1yuulWM1P
	CFC8mdhc
X-Received: by 2002:a05:6830:6c14:b0:7e5:68ca:89d1 with SMTP id
 46e09a7af769-7e7847d9352mr2139551a34.6.1781317634391; Fri, 12 Jun 2026
 19:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612025125.1690253-1-axboe@kernel.dk> <20260612025125.1690253-2-axboe@kernel.dk>
In-Reply-To: <20260612025125.1690253-2-axboe@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 12 Jun 2026 19:27:02 -0700
X-Gm-Features: AVVi8CeLMpaEkUe_FlL4ZWDUGBJVerdrqAwFhUU8k0abSySwmwuGpJwsRGp9VME
Message-ID: <CADUfDZqYzTU6Kt+_HPv05kxUe5h=CXO5g1k8cCXSt-UVxJuPag@mail.gmail.com>
Subject: Re: [PATCH 1/6] io_uring: grab RCU read lock marking task run
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dvyukov@google.com, krisman@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 7:51=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> Not required right now, as io_req_local_work_add() already calls this
> helper with the RCU read lock held. But in preparation for that not
> being the case, grab it locally.
>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

> ---
>  io_uring/tw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/io_uring/tw.c b/io_uring/tw.c
> index 023d5e6bc491..f4335c8d50d9 100644
> --- a/io_uring/tw.c
> +++ b/io_uring/tw.c
> @@ -158,11 +158,11 @@ void tctx_task_work(struct callback_head *cb)
>   */
>  static void io_ctx_mark_taskrun(struct io_ring_ctx *ctx)
>  {
> -       lockdep_assert_in_rcu_read_lock();
> -
>         if (ctx->flags & IORING_SETUP_TASKRUN_FLAG) {
> -               struct io_rings *rings =3D rcu_dereference(ctx->rings_rcu=
);
> +               struct io_rings *rings;
>
> +               guard(rcu)();
> +               rings =3D rcu_dereference(ctx->rings_rcu);
>                 atomic_or(IORING_SQ_TASKRUN, &rings->sq_flags);
>         }
>  }
> --
> 2.53.0
>
